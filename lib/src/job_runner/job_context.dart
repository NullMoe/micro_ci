import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';

import '../../micro_ci.dart';

part 'job_context.mapper.dart';


@MappableClass(
  generateMethods: GenerateMethods.stringify,
)
class JobContext with JobContextMappable {
  JobContext(this.name);

  final String name;

  /// Combined output of all processes run in job.
  StringBuffer stdout = StringBuffer();
  /// Combined error output of all processes run in job.
  StringBuffer stderr = StringBuffer();
  /// Combined output and error output of all processes run in job.
  StringBuffer combined = StringBuffer();
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
    stdout.write(result.stdout);
    stderr.write(result.stderr);
    combined
      ..write(result.stdout)
      ..write(result.stderr);
  }

  void logTelegramMessageResponse(TelegramMessage message) {
    rootTelegramMessageId ??= message.id;
    lastTelegramMessageId = message.id;
  }
}
