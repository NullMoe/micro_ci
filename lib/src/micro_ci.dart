import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';

import '../micro_ci.dart';
import '../tools/substitute_environment_variables.dart';
import 'job_runner/events/github_event_handler.dart';
import 'job_runner/job_context.dart';
import 'job_runner/job_runner_arguments.dart';


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

  Stream<JobContext> handleEvent(String eventName, Request request) async* {
    if (_configState != _MicroCIConfigState.ready)
      yield* Stream.error(Exception('Valid config was not provided. Use .updateConfig method.'), StackTrace.current);

    final payload = await request.readAsString();

    for (final MapEntry(key: name, value: job) in config.jobs.entries)
      try {
        yield await _runJob(
          name: name,
          job: job,
          arguments: _jobHandlers[name]!.handleEvent(eventName, payload),
        );
      } on FilterException catch (e) {
        logger.fine(e);
      } catch (e, stackTrace) {
        yield* Stream.error(e, stackTrace);
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
            job.directory.createSync();

            final processResult = await Process.run(script.command, [],
              runInShell: true,
              workingDirectory: job.directory.path,
              stdoutEncoding: utf8,
              stderrEncoding: utf8,
              environment: environment,
            );

            context.logProcessResult(processResult);

            context.lastExitCode = processResult.exitCode;
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
            await gitHubClient
              .createCommitStatus(headRepoFullName, headSha, checkStatus);
          case ActionCollectArtifacts(:final files):
            context.artifacts.addAll(files);
            await script.execute(job.directory, job.artifacts);
        }
      }
    }

    return context;
  }
}
