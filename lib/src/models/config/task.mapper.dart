// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'task.dart';

class TaskMapper extends ClassMapperBase<Task> {
  TaskMapper._();

  static TaskMapper? _instance;
  static TaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskMapper._());
      ScriptMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Task';

  static String _$name(Task v) => v.name;
  static const Field<Task, String> _f$name = Field('name', _$name);
  static List<Script> _$script(Task v) => v.script;
  static const Field<Task, List<Script>> _f$script = Field('script', _$script);
  static Map<String, String> _$env(Task v) => v.env;
  static const Field<Task, Map<String, String>> _f$env = Field('env', _$env,
      opt: true, def: const {}, hook: ListOfStringsToMapHook());
  static bool _$onError(Task v) => v.onError;
  static const Field<Task, bool> _f$onError =
      Field('onError', _$onError, key: 'on_error', opt: true, def: false);
  static bool _$onAny(Task v) => v.onAny;
  static const Field<Task, bool> _f$onAny =
      Field('onAny', _$onAny, key: 'on_any', opt: true, def: false);

  @override
  final Map<Symbol, Field<Task, dynamic>> fields = const {
    #name: _f$name,
    #script: _f$script,
    #env: _f$env,
    #onError: _f$onError,
    #onAny: _f$onAny,
  };

  static Task _instantiate(DecodingData data) {
    return Task(
        name: data.dec(_f$name),
        script: data.dec(_f$script),
        env: data.dec(_f$env),
        onError: data.dec(_f$onError),
        onAny: data.dec(_f$onAny));
  }

  @override
  final Function instantiate = _instantiate;

  static Task fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Task>(map));
  }

  static Task fromJson(String json) {
    return _guard((c) => c.fromJson<Task>(json));
  }
}

mixin TaskMappable {
  String toJson() {
    return TaskMapper._guard((c) => c.toJson(this as Task));
  }

  Map<String, dynamic> toMap() {
    return TaskMapper._guard((c) => c.toMap(this as Task));
  }

  TaskCopyWith<Task, Task, Task> get copyWith =>
      _TaskCopyWithImpl(this as Task, $identity, $identity);
  @override
  String toString() {
    return TaskMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TaskMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return TaskMapper._guard((c) => c.hash(this));
  }
}

extension TaskValueCopy<$R, $Out> on ObjectCopyWith<$R, Task, $Out> {
  TaskCopyWith<$R, Task, $Out> get $asTask =>
      $base.as((v, t, t2) => _TaskCopyWithImpl(v, t, t2));
}

abstract class TaskCopyWith<$R, $In extends Task, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Script, ObjectCopyWith<$R, Script, Script>> get script;
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>> get env;
  $R call(
      {String? name,
      List<Script>? script,
      Map<String, String>? env,
      bool? onError,
      bool? onAny});
  TaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Task, $Out>
    implements TaskCopyWith<$R, Task, $Out> {
  _TaskCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Task> $mapper = TaskMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Script, ObjectCopyWith<$R, Script, Script>> get script =>
      ListCopyWith($value.script, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(script: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>> get env =>
      MapCopyWith($value.env, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(env: v));
  @override
  $R call(
          {String? name,
          List<Script>? script,
          Map<String, String>? env,
          bool? onError,
          bool? onAny}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (script != null) #script: script,
        if (env != null) #env: env,
        if (onError != null) #onError: onError,
        if (onAny != null) #onAny: onAny
      }));
  @override
  Task $make(CopyWithData data) => Task(
      name: data.get(#name, or: $value.name),
      script: data.get(#script, or: $value.script),
      env: data.get(#env, or: $value.env),
      onError: data.get(#onError, or: $value.onError),
      onAny: data.get(#onAny, or: $value.onAny));

  @override
  TaskCopyWith<$R2, Task, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TaskCopyWithImpl($value, $cast, t);
}
