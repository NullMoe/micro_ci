import 'dart:io';

import '../../micro_ci.dart';

class JobContext {
  JobContext(this.name);

  final String name;

  /// Combined output of all processes run in job.
  String stdout = '';
  /// Combined error output of all processes run in job.
  String stderr = '';
  /// Combined output and error output of all processes run in job.
  String combined = '';
  /// Name of last executed task in job.
  String? lastTaskName;
  /// Exit code of last script command.
  int lastExitCode = 0;
  /// Index of last executed script in task.
  int lastScriptNo = -1;
  /// Id of the first sent telegram message.
  int? rootTelegramMessageId;
  /// Id of the last sent telegram message.
  int? lastTelegramMessageId;
  List<ActionCollectArtifactsFile> artifacts = [];

  void logProcessResult(ProcessResult result) {
    stdout += '${result.stdout}';
    stderr += '${result.stderr}';
    combined += '${result.stdout}\n${result.stderr}';
  }

  void logTelegramMessageResponse(TelegramMessage message) {
    rootTelegramMessageId ??= message.id;
    lastTelegramMessageId = message.id;
  }

  @override
  String toString() => '''
\t$name:
\t\tlastTaskName: $lastTaskName
\t\tlastExitCode: $lastExitCode
\t\tlastScriptNo: $lastScriptNo
\t\trootTelegramMessageId: $rootTelegramMessageId
\t\tlastTelegramMessageId: $lastTelegramMessageId''';
}
