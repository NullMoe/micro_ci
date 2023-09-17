import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import '../clients.dart';
import '../config/job.dart';
import '../config/scripts/action/collect_artifact/collect_artifacts_file.dart';
import '../config/scripts/script.dart';


// Can be used to run Isolate in future.
typedef RunInitialParameters = ({
  String headBranch,
  String headRepoFullName,
  String headSha,
  String? baseBranch,
  String? baseRepoFullName,
  String? baseSha,
  String jobName,
  Job job,
});

final Map<String, List<Isolate>> jobsQueue = {};

void _log(IOSink sink, RunInitialParameters runParameters, String message) =>
  sink.writeln('run(${runParameters.jobName}): $message');

String subStituteEnvironmentVariables(Map<String, String> env, String string) =>
  string.replaceAllMapped(RegExp('%([A-Za-z0-9_-]+)%'),
    (match) => env[match.group(1)] ?? '%${match.group(1)}%',
  );

Future<void> run(RunInitialParameters parameters) async {
  final RunInitialParameters(
    :job,
    :jobName,
    :baseBranch,
    :baseSha,
    :baseRepoFullName,
    :headBranch,
    :headSha,
    :headRepoFullName,
  ) = parameters;

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
          ...task.environmentVariables,
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
            job.ioDirectory.createSync();

            final processResult = await Process.run(script.command, [],
              runInShell: true,
              workingDirectory: job.ioDirectory.path,
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
                        job.ioDirectory.path,
                        job.ioArtifactsDirectory.path,
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

                }
            }
          case ActionApplyCheckStatus():
            await script.execute(gitHubClient, headSha, headRepoFullName);
          case ActionCollectArtifacts(:final files):
            artifacts.addAll(files);
            await script.execute(job.ioDirectory, job.ioArtifactsDirectory);
          case ActionUnknownBuiltinScript():
            _log(stdout, parameters, 'WARNING! Unknown script was presented in job: $jobName, task: ${task.name}, scriptN: $scriptN!');
        }
      }
    }
  }
}
