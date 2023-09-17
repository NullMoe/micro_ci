// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'job.dart';

class JobMapper extends ClassMapperBase<Job> {
  JobMapper._();

  static JobMapper? _instance;
  static JobMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JobMapper._());
      EventMapper.ensureInitialized();
      TaskMapper.ensureInitialized();
      EnvModeMapper.ensureInitialized();
      QueueModeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Job';

  static List<Event> _$events(Job v) => v.events;
  static const Field<Job, List<Event>> _f$events = Field('events', _$events);
  static List<Task> _$tasks(Job v) => v.tasks;
  static const Field<Job, List<Task>> _f$tasks = Field('tasks', _$tasks);
  static String _$workingDirectory(Job v) => v.workingDirectory;
  static const Field<Job, String> _f$workingDirectory =
      Field('workingDirectory', _$workingDirectory, key: 'working_directory');
  static String _$artifactsDirectory(Job v) => v.artifactsDirectory;
  static const Field<Job, String> _f$artifactsDirectory = Field(
      'artifactsDirectory', _$artifactsDirectory,
      key: 'artifacts_directory', opt: true, def: '__artifacts');
  static Map<String, String> _$env(Job v) => v.env;
  static const Field<Job, Map<String, String>> _f$env = Field('env', _$env,
      opt: true, def: const {}, hook: ListOfStringsToMapHook());
  static EnvMode _$envMode(Job v) => v.envMode;
  static const Field<Job, EnvMode> _f$envMode = Field('envMode', _$envMode,
      key: 'env_mode', opt: true, def: EnvMode.inherit);
  static QueueMode _$queueMode(Job v) => v.queueMode;
  static const Field<Job, QueueMode> _f$queueMode = Field(
      'queueMode', _$queueMode,
      key: 'queue_mode', opt: true, def: QueueMode.restart);

  @override
  final Map<Symbol, Field<Job, dynamic>> fields = const {
    #events: _f$events,
    #tasks: _f$tasks,
    #workingDirectory: _f$workingDirectory,
    #artifactsDirectory: _f$artifactsDirectory,
    #env: _f$env,
    #envMode: _f$envMode,
    #queueMode: _f$queueMode,
  };

  static Job _instantiate(DecodingData data) {
    return Job(
        events: data.dec(_f$events),
        tasks: data.dec(_f$tasks),
        workingDirectory: data.dec(_f$workingDirectory),
        artifactsDirectory: data.dec(_f$artifactsDirectory),
        env: data.dec(_f$env),
        envMode: data.dec(_f$envMode),
        queueMode: data.dec(_f$queueMode));
  }

  @override
  final Function instantiate = _instantiate;

  static Job fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Job>(map));
  }

  static Job fromJson(String json) {
    return _guard((c) => c.fromJson<Job>(json));
  }
}

mixin JobMappable {
  String toJson() {
    return JobMapper._guard((c) => c.toJson(this as Job));
  }

  Map<String, dynamic> toMap() {
    return JobMapper._guard((c) => c.toMap(this as Job));
  }

  JobCopyWith<Job, Job, Job> get copyWith =>
      _JobCopyWithImpl(this as Job, $identity, $identity);
  @override
  String toString() {
    return JobMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            JobMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return JobMapper._guard((c) => c.hash(this));
  }
}

extension JobValueCopy<$R, $Out> on ObjectCopyWith<$R, Job, $Out> {
  JobCopyWith<$R, Job, $Out> get $asJob =>
      $base.as((v, t, t2) => _JobCopyWithImpl(v, t, t2));
}

abstract class JobCopyWith<$R, $In extends Job, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Event, ObjectCopyWith<$R, Event, Event>> get events;
  ListCopyWith<$R, Task, TaskCopyWith<$R, Task, Task>> get tasks;
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>> get env;
  $R call(
      {List<Event>? events,
      List<Task>? tasks,
      String? workingDirectory,
      String? artifactsDirectory,
      Map<String, String>? env,
      EnvMode? envMode,
      QueueMode? queueMode});
  JobCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JobCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Job, $Out>
    implements JobCopyWith<$R, Job, $Out> {
  _JobCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Job> $mapper = JobMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Event, ObjectCopyWith<$R, Event, Event>> get events =>
      ListCopyWith($value.events, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(events: v));
  @override
  ListCopyWith<$R, Task, TaskCopyWith<$R, Task, Task>> get tasks =>
      ListCopyWith(
          $value.tasks, (v, t) => v.copyWith.$chain(t), (v) => call(tasks: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>> get env =>
      MapCopyWith($value.env, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(env: v));
  @override
  $R call(
          {List<Event>? events,
          List<Task>? tasks,
          String? workingDirectory,
          String? artifactsDirectory,
          Map<String, String>? env,
          EnvMode? envMode,
          QueueMode? queueMode}) =>
      $apply(FieldCopyWithData({
        if (events != null) #events: events,
        if (tasks != null) #tasks: tasks,
        if (workingDirectory != null) #workingDirectory: workingDirectory,
        if (artifactsDirectory != null) #artifactsDirectory: artifactsDirectory,
        if (env != null) #env: env,
        if (envMode != null) #envMode: envMode,
        if (queueMode != null) #queueMode: queueMode
      }));
  @override
  Job $make(CopyWithData data) => Job(
      events: data.get(#events, or: $value.events),
      tasks: data.get(#tasks, or: $value.tasks),
      workingDirectory:
          data.get(#workingDirectory, or: $value.workingDirectory),
      artifactsDirectory:
          data.get(#artifactsDirectory, or: $value.artifactsDirectory),
      env: data.get(#env, or: $value.env),
      envMode: data.get(#envMode, or: $value.envMode),
      queueMode: data.get(#queueMode, or: $value.queueMode));

  @override
  JobCopyWith<$R2, Job, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _JobCopyWithImpl($value, $cast, t);
}
