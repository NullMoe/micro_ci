import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';

import '../micro_ci.dart';
import '../tools/command_line_arguments_converter.dart';
import '../tools/substitute_environment_variables.dart';
import 'clients/github_client.dart';
import 'clients/telegram_client.dart';
import 'job_runner/github_event_handler.dart';
import 'job_runner/job_context.dart';
import 'job_runner/job_runner_arguments.dart';
import 'models/config/models.dart';
import 'models/github/webhook_models/payload.dart';


enum _MicroCIConfigState {
  initial,
  ready,
  error,
}

class MicroCI {
  MicroCI();

  static final Logger logger = Logger('micro_ci');

  static const _configFileName = '.env';
  final _serverConfig = ServerConfig.load(_configFileName);

  late final GitHubClient gitHubClient =
    GitHubClient(token: _serverConfig.gitHubToken);
  late final TelegramClient telegramClient =
    TelegramClient(token: _serverConfig.telegramToken);

  _MicroCIConfigState _configState = _MicroCIConfigState.initial;
  late Config config;

  late Map<String, GitHubEventHandler> _jobHandlers;

  String get ciToken => _serverConfig.ciToken;
  int get ciPort => _serverConfig.ciPort;

  void updateConfig(Config? newConfig) {
    if (newConfig == null) {
      _configState = _MicroCIConfigState.error;
      _jobHandlers.clear();
      logger.warning('Invalid config supplied.');
      return;
    }

    logger.info('New config supplied.');
    config = newConfig;
    _configState = _MicroCIConfigState.ready;

    logger.info('Updating job handlers.');
    _jobHandlers = {
      for (final MapEntry(key: name, value: job) in newConfig.jobs.entries)
        name: GitHubEventHandler(job.events),
    };
  }

  StreamSubscription<JobContext> handleEvent(String eventName, String payload) =>
    _handleEvent(eventName, payload)
      .listen((context) => logger.finer('Job results:\n$context'),
        // ignore: avoid_types_on_closure_parameters
        onError: (Object error, StackTrace stackTrace) {
          switch (error) {
            case InfoException():
              logger.info(error.message, error.original);
            default:
              logger.severe('Error while handling event', error, stackTrace);
          }
        },
      );

  Stream<JobContext> _handleEvent(String eventName, String payload) async* {
    if (_configState != _MicroCIConfigState.ready)
      throw Exception('Valid config was not provided. Use .updateConfig method.');

    final webHookPayload = WebHookPayload.parse(payload);
    // TODO: rewrite Webhook response parsing.
    if (webHookPayload is WebHookPayloadUnknown || webHookPayload is WebHookPullRequestReviewUnknown)
      throw Exception('Webhook payload is unknown.');

    for (final MapEntry(key: name, value: job) in config.jobs.entries) {
      final lowerCaseRepoFullName = webHookPayload.fullName.toLowerCase();
      if (job.repositories.isNotEmpty && !job.repositories.any((e) => e.toLowerCase() == lowerCaseRepoFullName)) {
        yield* Stream.error(FilterException('Repository does not match filters.'), StackTrace.current);
        continue;
      }

      try {
        final arguments = _jobHandlers[name]!.handleEvent(eventName, webHookPayload);

        yield await _runJob(
          name: name,
          job: job,
          arguments: arguments,
        );
      } on FilterException catch (e) {
        logger.fine(e);
      } catch (e, stackTrace) {
        yield* Stream.error(e, stackTrace);
      }
    }
  }

  Future<JobContext> _runJob({
    required String name,
    required Job job,
    required JobRunnerArguments arguments,
  }) async {
    final JobRunnerArguments(
      :baseBranch,
      :baseSha,
      :baseRepoFullName,
      :headBranch,
      :headSha,
      :headRepoFullName,
    ) = arguments;

    final context = JobContext(name);
    final logger = Logger('micro_ci.job_runner');

    for (final task in job.tasks) {
      context
        ..lastTaskName = task.name
        ..lastScriptNo = 0;
      if ((context.lastExitCode != 0 ) != task.onError)
        continue;

      script: for (final script in task.script) {
        context.lastScriptNo++;
        final environment = {
          ...job.env,
          ...task.env,
          'BUILD_STATUS': '${context.lastExitCode}',
          'BASE_BRANCH': baseBranch ?? '',
          'BASE_SHA': baseSha ?? '',
          'BASE_REPO_FULL_NAME': baseRepoFullName ?? '',
          'HEAD_BRANCH': headBranch,
          'HEAD_SHA': headSha,
          'HEAD_REPO_FULL_NAME': headRepoFullName,
        };

        switch (script) {
          case Command():
            final _command = const CommandLineArgumentsConverter()
              .convert(script.command);
            if (_command.isEmpty)
              throw Exception('Command script is an empty command.');

            job.directory.createSync(recursive: true);
            final [ executable, ...arguments, ] = _command;
            final process = await Process.start(
              executable,
              arguments,
              runInShell: true,
              workingDirectory: job.directory.path,
              includeParentEnvironment: job.envMode == EnvMode.inherit,
              environment: environment,
            );

            context.combined.write('$executable: ');

            process.stdout.transform(const Utf8Decoder(allowMalformed: true))
              .listen((data) {
                context.logStdout(data);
                logger.fine(data);
              });

            process.stderr.transform(const Utf8Decoder(allowMalformed: true))
              .listen((data) {
                context.logStderr(data);
                logger.fine(data);
              });

            context.lastExitCode = await process.exitCode;
            if (context.lastExitCode != 0)
              break script;

          case ActionTelegramMessage(
            :final type,
            :final chatId,
            :final message,
            :final useReply,
            ):
            final formattedMessage =
              message?.substituteEnvironmentVariables(environment);

            switch (type) {
              case 'msg':
                final response = await telegramClient.sendMessage(
                  chatId: chatId,
                  message: formattedMessage ?? 'No message was specified!',
                  replyTo: useReply ? context.rootTelegramMessageId : null,
                );
                context.logTelegramMessageResponse(response);
              case 'post_error_log':
                final response = await telegramClient.sendMessage(
                  chatId: chatId,
                  message: (formattedMessage?.padRight(formattedMessage.length + 1, '\n') ?? '') + context.combined.toString(),
                  replyTo: useReply ? context.rootTelegramMessageId : null,
                );
                context.logTelegramMessageResponse(response);
              case 'post_artifacts':
                final response = await telegramClient.sendMessage(
                  chatId: chatId,
                  message: formattedMessage ?? 'Build Artifacts:',
                  replyTo: useReply ? context.rootTelegramMessageId : null,
                );
                context.logTelegramMessageResponse(response);
                final responseStream = telegramClient.sendMediaGroup(
                  chatId: chatId,
                  replyTo: useReply ? context.rootTelegramMessageId : null,
                  media: context.artifacts.map(
                    (file) => (
                      path: file.getAbsolutePath(
                        job.directory.path,
                        job.artifacts.path,
                      ),
                      name: file is ActionCollectArtifactsFileObject ?
                        file.name :
                        null,
                      caption: file is ActionCollectArtifactsFileObject ?
                        file.caption :
                        null,
                    ),
                  ),
                );

                await responseStream
                  .expand((element) => element)
                  .forEach(context.logTelegramMessageResponse);
            }
          case ActionApplyCheckStatus(:final checkStatus):
            logger.finest(await gitHubClient
              .createCommitStatus(
                headRepoFullName,
                headSha,
                checkStatus.substituteEnvironmentVariables(environment),
              ),
            );
          case ActionCollectArtifacts(:final files):
            job.artifacts.createSync(recursive: true);
            context.artifacts.addAll([
              for (final file in files)
                file.substituteEnvironmentVariables(environment),
            ]);
            await script.execute(job.directory, job.artifacts);
        }
      }
    }

    return context;
  }
}
