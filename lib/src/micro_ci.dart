import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

import '../micro_ci.dart';
import '../tools/list_of_strings_to_map.dart';
import 'job_runner/events/github_event_handler.dart';
import 'job_runner/job_runner_arguments.dart';

class MicroCI {
  MicroCI({
    required this.configFile,
    Level? loggerLevel,
  }) : logger = Logger(level: loggerLevel) {
    /// First config initialization is sync.
    logger.i('Initializing config...');
    config = ConfigMapper.fromJson(
      jsonEncode(
        loadYaml(
          configFile.readAsStringSync(),
        ),
      ),
    );
    // TODO: validate config.
    _updateJobHandlers();
    updateWatcher();
  }

  final _serverConfig = ServerConfig.load('.env');

  final Logger logger;

  late final GitHubClient gitHubClient =
    GitHubClient(token: _serverConfig.gitHubToken);
  late final TelegramClient telegramClient =
    TelegramClient(token: _serverConfig.telegramToken);

  final File configFile;
  late Config config;

  late Map<String, GitHubEventHandler> _jobHandlers;
  StreamSubscription<FileSystemEvent>? _configWatcher;

  String get ciToken => _serverConfig.ciToken;
  int get ciPort => _serverConfig.ciPort;

  Future<Config> _getConfig() async => ConfigMapper.fromJson(
      jsonEncode(
        loadYaml(
          await configFile.readAsString(),
        ),
      ),
    );

  void _updateJobHandlers() {
    logger.i('Updating job\'s handlers...');
    _jobHandlers = {
      for (final MapEntry(key: name, value: job) in config.jobs.entries)
        name: GitHubEventHandler(job.events),
    };
  }

  Future<void> updateConfig() async {
    config = await _getConfig();
    _updateJobHandlers();
  }

  Future<void> _watcherUpdateConfig(FileSystemEvent event) async {
    if (File(event.path).absolute.path == configFile.absolute.path)
      return;

    try {
      await updateConfig();
    } catch (e) {
      // TODO: error
      logger.w('Config watcher: Invalid config.', error: e);
    }
  }

  Future<void> updateWatcher() async {
    logger.i('Updating "${basename(configFile.path)}" file\'s watcher.');
    if (_configWatcher != null)
      await _configWatcher!.cancel();

    _configWatcher = configFile.parent.watch(
      events: FileSystemEvent.modify,
    ).listen(_watcherUpdateConfig);
  }

  String _subStituteEnvironmentVariables(Map<String, String> env, String string) =>
    string.replaceAllMapped(RegExp('%([A-Za-z0-9_-]+)%'),
      (match) => env[match.group(1)] ?? '%${match.group(1)}%',
    );

  void handleEvent(String eventName, String payload) {
    for (final MapEntry(key: name, value: job) in config.jobs.entries)
      try {
        unawaited(_runJob(
          name: name,
          job: job,
          arguments: _jobHandlers[name]!.handleEvent(eventName, payload),
        ),);
      } catch (e) {
        logger.e(e);
      }

    // TODO: result is important
  }

  Future<void> _runJob({
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

    // TODO: Mappable class with all run context.
    var error = 0;
    var processesOutput = '';
    int? rootTelegramMessageId;
    final artifacts = <ActionCollectArtifactsFile>[];

    for (final task in job.tasks) {
      if ((error != 0) == task.onError) {
        for (final script in task.script) {
          final environment = {
            ...job.environmentVariables,
            ...task.env.splitToMap('='), // TODO: there might be an error
            'BUILD_STATUS': '$error',
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

              processesOutput += processResult.stdout as String;
              processesOutput += processResult.stderr as String;

              error = processResult.exitCode;
              if (error != 0)
                break;

            case ActionTelegramMessage(
              :final type,
              :final chatId,
              :final message,
              :final useReply,
              ):
              final formattedMessage = message != null ? _subStituteEnvironmentVariables(
                environment, message,
              ) : null;

              switch (type) {
                case 'msg':
                  final response = await telegramClient.sendMessage(
                    chatId: chatId,
                    message: formattedMessage ?? 'No message was specified!',
                    replyTo: useReply ? rootTelegramMessageId : null,
                  );
                  rootTelegramMessageId ??= response.id;
                case 'post_error_log':
                  final response = await telegramClient.sendMessage(
                    chatId: chatId,
                    message: (formattedMessage?.padRight(formattedMessage.length + 1, '\n') ?? '') + processesOutput,
                    replyTo: useReply ? rootTelegramMessageId : null,
                  );
                  rootTelegramMessageId ??= response.id;
                case 'post_artifacts':
                  final response = await telegramClient.sendMessage(
                    chatId: chatId,
                    message: formattedMessage ?? 'Build Artifacts:',
                    replyTo: useReply ? rootTelegramMessageId : null,
                  );
                  rootTelegramMessageId ??= response.id;
                  final responseStream = telegramClient.sendMediaGroup(
                    chatId: chatId,
                    replyTo: useReply ? rootTelegramMessageId : null,
                    media: artifacts.map(
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

                  await for (final _ in responseStream) { }
              }
            case ActionApplyCheckStatus(:final checkStatus):
              await gitHubClient
                .createCommitStatus(headRepoFullName, headSha, checkStatus);
            case ActionCollectArtifacts(:final files):
              artifacts.addAll(files);
              await script.execute(job.directory, job.artifacts);
            case ActionUnknownBuiltinScript():
              // _log(stdout, parameters, 'WARNING! Unknown script was presented in job: $jobName, task: ${task.name}, scriptN: $scriptN!');
          }
        }
      }
    }
  }
}
