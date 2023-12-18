// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'job_context.dart';

class JobContextMapper extends ClassMapperBase<JobContext> {
  JobContextMapper._();

  static JobContextMapper? _instance;
  static JobContextMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JobContextMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'JobContext';

  static String _$name(JobContext v) => v.name;
  static const Field<JobContext, String> _f$name = Field('name', _$name);
  static StringBuffer _$stdout(JobContext v) => v.stdout;
  static const Field<JobContext, StringBuffer> _f$stdout =
      Field('stdout', _$stdout, mode: FieldMode.member);
  static StringBuffer _$stderr(JobContext v) => v.stderr;
  static const Field<JobContext, StringBuffer> _f$stderr =
      Field('stderr', _$stderr, mode: FieldMode.member);
  static StringBuffer _$combined(JobContext v) => v.combined;
  static const Field<JobContext, StringBuffer> _f$combined =
      Field('combined', _$combined, mode: FieldMode.member);
  static String? _$lastTaskName(JobContext v) => v.lastTaskName;
  static const Field<JobContext, String> _f$lastTaskName = Field(
      'lastTaskName', _$lastTaskName,
      key: 'last_task_name', mode: FieldMode.member);
  static int _$lastExitCode(JobContext v) => v.lastExitCode;
  static const Field<JobContext, int> _f$lastExitCode = Field(
      'lastExitCode', _$lastExitCode,
      key: 'last_exit_code', mode: FieldMode.member);
  static int _$lastScriptNo(JobContext v) => v.lastScriptNo;
  static const Field<JobContext, int> _f$lastScriptNo = Field(
      'lastScriptNo', _$lastScriptNo,
      key: 'last_script_no', mode: FieldMode.member);
  static int? _$rootTelegramMessageId(JobContext v) => v.rootTelegramMessageId;
  static const Field<JobContext, int> _f$rootTelegramMessageId = Field(
      'rootTelegramMessageId', _$rootTelegramMessageId,
      key: 'root_telegram_message_id', mode: FieldMode.member);
  static int? _$lastTelegramMessageId(JobContext v) => v.lastTelegramMessageId;
  static const Field<JobContext, int> _f$lastTelegramMessageId = Field(
      'lastTelegramMessageId', _$lastTelegramMessageId,
      key: 'last_telegram_message_id', mode: FieldMode.member);
  static List<ActionCollectArtifactsFile> _$artifacts(JobContext v) =>
      v.artifacts;
  static const Field<JobContext, List<ActionCollectArtifactsFile>>
      _f$artifacts = Field('artifacts', _$artifacts, mode: FieldMode.member);

  @override
  final Map<Symbol, Field<JobContext, dynamic>> fields = const {
    #name: _f$name,
    #stdout: _f$stdout,
    #stderr: _f$stderr,
    #combined: _f$combined,
    #lastTaskName: _f$lastTaskName,
    #lastExitCode: _f$lastExitCode,
    #lastScriptNo: _f$lastScriptNo,
    #rootTelegramMessageId: _f$rootTelegramMessageId,
    #lastTelegramMessageId: _f$lastTelegramMessageId,
    #artifacts: _f$artifacts,
  };

  static JobContext _instantiate(DecodingData data) {
    return JobContext(data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin JobContextMappable {
  @override
  String toString() {
    return JobContextMapper._guard((c) => c.asString(this));
  }
}
