// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'check_status.dart';

class CheckStatusMapper extends ClassMapperBase<CheckStatus> {
  CheckStatusMapper._();

  static CheckStatusMapper? _instance;
  static CheckStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CheckStatusMapper._());
      CheckStatusStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CheckStatus';

  static CheckStatusState _$state(CheckStatus v) => v.state;
  static const Field<CheckStatus, CheckStatusState> _f$state =
      Field('state', _$state);
  static String? _$targetUrl(CheckStatus v) => v.targetUrl;
  static const Field<CheckStatus, String> _f$targetUrl =
      Field('targetUrl', _$targetUrl, key: 'target_url', opt: true);
  static String? _$description(CheckStatus v) => v.description;
  static const Field<CheckStatus, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$context(CheckStatus v) => v.context;
  static const Field<CheckStatus, String> _f$context =
      Field('context', _$context, opt: true);

  @override
  final Map<Symbol, Field<CheckStatus, dynamic>> fields = const {
    #state: _f$state,
    #targetUrl: _f$targetUrl,
    #description: _f$description,
    #context: _f$context,
  };

  @override
  final MappingHook hook = const EmptyToNullHook();
  static CheckStatus _instantiate(DecodingData data) {
    return CheckStatus(
        state: data.dec(_f$state),
        targetUrl: data.dec(_f$targetUrl),
        description: data.dec(_f$description),
        context: data.dec(_f$context));
  }

  @override
  final Function instantiate = _instantiate;

  static CheckStatus fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CheckStatus>(map));
  }

  static CheckStatus fromJson(String json) {
    return _guard((c) => c.fromJson<CheckStatus>(json));
  }
}

mixin CheckStatusMappable {
  String toJson() {
    return CheckStatusMapper._guard((c) => c.toJson(this as CheckStatus));
  }

  Map<String, dynamic> toMap() {
    return CheckStatusMapper._guard((c) => c.toMap(this as CheckStatus));
  }

  CheckStatusCopyWith<CheckStatus, CheckStatus, CheckStatus> get copyWith =>
      _CheckStatusCopyWithImpl(this as CheckStatus, $identity, $identity);
  @override
  String toString() {
    return CheckStatusMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CheckStatusMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CheckStatusMapper._guard((c) => c.hash(this));
  }
}

extension CheckStatusValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CheckStatus, $Out> {
  CheckStatusCopyWith<$R, CheckStatus, $Out> get $asCheckStatus =>
      $base.as((v, t, t2) => _CheckStatusCopyWithImpl(v, t, t2));
}

abstract class CheckStatusCopyWith<$R, $In extends CheckStatus, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {CheckStatusState? state,
      String? targetUrl,
      String? description,
      String? context});
  CheckStatusCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CheckStatusCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CheckStatus, $Out>
    implements CheckStatusCopyWith<$R, CheckStatus, $Out> {
  _CheckStatusCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CheckStatus> $mapper =
      CheckStatusMapper.ensureInitialized();
  @override
  $R call(
          {CheckStatusState? state,
          Object? targetUrl = $none,
          Object? description = $none,
          Object? context = $none}) =>
      $apply(FieldCopyWithData({
        if (state != null) #state: state,
        if (targetUrl != $none) #targetUrl: targetUrl,
        if (description != $none) #description: description,
        if (context != $none) #context: context
      }));
  @override
  CheckStatus $make(CopyWithData data) => CheckStatus(
      state: data.get(#state, or: $value.state),
      targetUrl: data.get(#targetUrl, or: $value.targetUrl),
      description: data.get(#description, or: $value.description),
      context: data.get(#context, or: $value.context));

  @override
  CheckStatusCopyWith<$R2, CheckStatus, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CheckStatusCopyWithImpl($value, $cast, t);
}
