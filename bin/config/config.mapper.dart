// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'config.dart';

class ConfigMapper extends ClassMapperBase<Config> {
  ConfigMapper._();

  static ConfigMapper? _instance;
  static ConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfigMapper._());
      JobMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Config';

  static String _$version(Config v) => v.version;
  static const Field<Config, String> _f$version = Field('version', _$version);
  static Map<String, Job> _$jobs(Config v) => v.jobs;
  static const Field<Config, Map<String, Job>> _f$jobs = Field('jobs', _$jobs);

  @override
  final Map<Symbol, Field<Config, dynamic>> fields = const {
    #version: _f$version,
    #jobs: _f$jobs,
  };

  static Config _instantiate(DecodingData data) {
    return Config(version: data.dec(_f$version), jobs: data.dec(_f$jobs));
  }

  @override
  final Function instantiate = _instantiate;

  static Config fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Config>(map));
  }

  static Config fromJson(String json) {
    return _guard((c) => c.fromJson<Config>(json));
  }
}

mixin ConfigMappable {
  String toJson() {
    return ConfigMapper._guard((c) => c.toJson(this as Config));
  }

  Map<String, dynamic> toMap() {
    return ConfigMapper._guard((c) => c.toMap(this as Config));
  }

  ConfigCopyWith<Config, Config, Config> get copyWith =>
      _ConfigCopyWithImpl(this as Config, $identity, $identity);
  @override
  String toString() {
    return ConfigMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ConfigMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ConfigMapper._guard((c) => c.hash(this));
  }
}

extension ConfigValueCopy<$R, $Out> on ObjectCopyWith<$R, Config, $Out> {
  ConfigCopyWith<$R, Config, $Out> get $asConfig =>
      $base.as((v, t, t2) => _ConfigCopyWithImpl(v, t, t2));
}

abstract class ConfigCopyWith<$R, $In extends Config, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, Job, JobCopyWith<$R, Job, Job>> get jobs;
  $R call({String? version, Map<String, Job>? jobs});
  ConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConfigCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Config, $Out>
    implements ConfigCopyWith<$R, Config, $Out> {
  _ConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Config> $mapper = ConfigMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, Job, JobCopyWith<$R, Job, Job>> get jobs =>
      MapCopyWith(
          $value.jobs, (v, t) => v.copyWith.$chain(t), (v) => call(jobs: v));
  @override
  $R call({String? version, Map<String, Job>? jobs}) =>
      $apply(FieldCopyWithData({
        if (version != null) #version: version,
        if (jobs != null) #jobs: jobs
      }));
  @override
  Config $make(CopyWithData data) => Config(
      version: data.get(#version, or: $value.version),
      jobs: data.get(#jobs, or: $value.jobs));

  @override
  ConfigCopyWith<$R2, Config, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ConfigCopyWithImpl($value, $cast, t);
}
