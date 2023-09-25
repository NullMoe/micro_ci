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

  void logStdout(String event) {
    stdout.write(event);
    combined.write(event);
  }

  void logStderr(String event) {
    stderr.write(event);
    combined.write(event);
  }

  void logTelegramMessageResponse(TelegramMessage message) {
    rootTelegramMessageId ??= message.id;
    lastTelegramMessageId = message.id;
  }
}
