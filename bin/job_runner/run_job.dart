import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import '../clients.dart';
import '../config/models.dart';
import '../config/script/action/collect_artifact/collect_artifacts_file.dart';
import '../server.dart';
import 'job_runner_arguments.dart';
import '../tools/list_of_strings_to_map.dart';


final Map<String, List<Isolate>> jobsQueue = {};


String subStituteEnvironmentVariables(Map<String, String> env, String string) =>
  string.replaceAllMapped(RegExp('%([A-Za-z0-9_-]+)%'),
    (match) => env[match.group(1)] ?? '%${match.group(1)}%',
  );

// TODO: convert to modern coding standarts with singleton class JobRunner.
Future<void> runJob({
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
    var scriptN = 0;
    if ((error != 0) == task.onError) {
      for (final script in task.script) {
        scriptN++;
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
            final formattedMessage = message != null ? subStituteEnvironmentVariables(
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

                await for (final _ in responseStream) {
                  logger.i(_);
                }
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
