// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'response.dart';

class TelegramResponseMapper extends ClassMapperBase<TelegramResponse> {
  TelegramResponseMapper._();

  static TelegramResponseMapper? _instance;
  static TelegramResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TelegramResponseMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'TelegramResponse';
  @override
  Function get typeFactory => <T>(f) => f<TelegramResponse<T>>();

  static bool _$ok(TelegramResponse v) => v.ok;
  static const Field<TelegramResponse, bool> _f$ok = Field('ok', _$ok);
  static dynamic _$result(TelegramResponse v) => v.result;
  static dynamic _arg$result<T>(f) => f<T>();
  static const Field<TelegramResponse, dynamic> _f$result =
      Field('result', _$result, arg: _arg$result);

  @override
  final Map<Symbol, Field<TelegramResponse, dynamic>> fields = const {
    #ok: _f$ok,
    #result: _f$result,
  };

  static TelegramResponse<T> _instantiate<T>(DecodingData data) {
    return TelegramResponse(ok: data.dec(_f$ok), result: data.dec(_f$result));
  }

  @override
  final Function instantiate = _instantiate;

  static TelegramResponse<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<TelegramResponse<T>>(map));
  }

  static TelegramResponse<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<TelegramResponse<T>>(json));
  }
}

mixin TelegramResponseMappable<T> {
  String toJson() {
    return TelegramResponseMapper._guard(
        (c) => c.toJson(this as TelegramResponse<T>));
  }

  Map<String, dynamic> toMap() {
    return TelegramResponseMapper._guard(
        (c) => c.toMap(this as TelegramResponse<T>));
  }

  TelegramResponseCopyWith<TelegramResponse<T>, TelegramResponse<T>,
          TelegramResponse<T>, T>
      get copyWith => _TelegramResponseCopyWithImpl(
          this as TelegramResponse<T>, $identity, $identity);
  @override
  String toString() {
    return TelegramResponseMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TelegramResponseMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return TelegramResponseMapper._guard((c) => c.hash(this));
  }
}

extension TelegramResponseValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, TelegramResponse<T>, $Out> {
  TelegramResponseCopyWith<$R, TelegramResponse<T>, $Out, T>
      get $asTelegramResponse =>
          $base.as((v, t, t2) => _TelegramResponseCopyWithImpl(v, t, t2));
}

abstract class TelegramResponseCopyWith<$R, $In extends TelegramResponse<T>,
    $Out, T> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? ok, T? result});
  TelegramResponseCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TelegramResponseCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, TelegramResponse<T>, $Out>
    implements TelegramResponseCopyWith<$R, TelegramResponse<T>, $Out, T> {
  _TelegramResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TelegramResponse> $mapper =
      TelegramResponseMapper.ensureInitialized();
  @override
  $R call({bool? ok, T? result}) => $apply(FieldCopyWithData(
      {if (ok != null) #ok: ok, if (result != null) #result: result}));
  @override
  TelegramResponse<T> $make(CopyWithData data) => TelegramResponse(
      ok: data.get(#ok, or: $value.ok),
      result: data.get(#result, or: $value.result));

  @override
  TelegramResponseCopyWith<$R2, TelegramResponse<T>, $Out2, T>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TelegramResponseCopyWithImpl($value, $cast, t);
}
