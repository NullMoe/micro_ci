// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user.dart';

class WebHookUserMapper extends ClassMapperBase<WebHookUser> {
  WebHookUserMapper._();

  static WebHookUserMapper? _instance;
  static WebHookUserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebHookUserMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookUser';

  static String _$login(WebHookUser v) => v.login;
  static const Field<WebHookUser, String> _f$login = Field('login', _$login);
  static int _$id(WebHookUser v) => v.id;
  static const Field<WebHookUser, int> _f$id = Field('id', _$id);

  @override
  final Map<Symbol, Field<WebHookUser, dynamic>> fields = const {
    #login: _f$login,
    #id: _f$id,
  };

  static WebHookUser _instantiate(DecodingData data) {
    return WebHookUser(login: data.dec(_f$login), id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookUser fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookUser>(map));
  }

  static WebHookUser fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookUser>(json));
  }
}

mixin WebHookUserMappable {
  String toJson() {
    return WebHookUserMapper._guard((c) => c.toJson(this as WebHookUser));
  }

  Map<String, dynamic> toMap() {
    return WebHookUserMapper._guard((c) => c.toMap(this as WebHookUser));
  }

  WebHookUserCopyWith<WebHookUser, WebHookUser, WebHookUser> get copyWith =>
      _WebHookUserCopyWithImpl(this as WebHookUser, $identity, $identity);
  @override
  String toString() {
    return WebHookUserMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookUserMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookUserMapper._guard((c) => c.hash(this));
  }
}

extension WebHookUserValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookUser, $Out> {
  WebHookUserCopyWith<$R, WebHookUser, $Out> get $asWebHookUser =>
      $base.as((v, t, t2) => _WebHookUserCopyWithImpl(v, t, t2));
}

abstract class WebHookUserCopyWith<$R, $In extends WebHookUser, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? login, int? id});
  WebHookUserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WebHookUserCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookUser, $Out>
    implements WebHookUserCopyWith<$R, WebHookUser, $Out> {
  _WebHookUserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookUser> $mapper =
      WebHookUserMapper.ensureInitialized();
  @override
  $R call({String? login, int? id}) => $apply(FieldCopyWithData(
      {if (login != null) #login: login, if (id != null) #id: id}));
  @override
  WebHookUser $make(CopyWithData data) => WebHookUser(
      login: data.get(#login, or: $value.login),
      id: data.get(#id, or: $value.id));

  @override
  WebHookUserCopyWith<$R2, WebHookUser, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebHookUserCopyWithImpl($value, $cast, t);
}
