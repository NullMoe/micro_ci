// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'repository.dart';

class WebHookRepositoryMapper extends ClassMapperBase<WebHookRepository> {
  WebHookRepositoryMapper._();

  static WebHookRepositoryMapper? _instance;
  static WebHookRepositoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebHookRepositoryMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookRepository';

  static int _$id(WebHookRepository v) => v.id;
  static const Field<WebHookRepository, int> _f$id = Field('id', _$id);
  static String _$nodeId(WebHookRepository v) => v.nodeId;
  static const Field<WebHookRepository, String> _f$nodeId =
      Field('nodeId', _$nodeId, key: 'node_id');
  static String _$name(WebHookRepository v) => v.name;
  static const Field<WebHookRepository, String> _f$name = Field('name', _$name);
  static String _$fullName(WebHookRepository v) => v.fullName;
  static const Field<WebHookRepository, String> _f$fullName =
      Field('fullName', _$fullName, key: 'full_name');
  static bool _$private(WebHookRepository v) => v.private;
  static const Field<WebHookRepository, bool> _f$private =
      Field('private', _$private);
  static String _$url(WebHookRepository v) => v.url;
  static const Field<WebHookRepository, String> _f$url = Field('url', _$url);

  @override
  final Map<Symbol, Field<WebHookRepository, dynamic>> fields = const {
    #id: _f$id,
    #nodeId: _f$nodeId,
    #name: _f$name,
    #fullName: _f$fullName,
    #private: _f$private,
    #url: _f$url,
  };

  static WebHookRepository _instantiate(DecodingData data) {
    return WebHookRepository(
        id: data.dec(_f$id),
        nodeId: data.dec(_f$nodeId),
        name: data.dec(_f$name),
        fullName: data.dec(_f$fullName),
        private: data.dec(_f$private),
        url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookRepository fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookRepository>(map));
  }

  static WebHookRepository fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookRepository>(json));
  }
}

mixin WebHookRepositoryMappable {
  String toJson() {
    return WebHookRepositoryMapper._guard(
        (c) => c.toJson(this as WebHookRepository));
  }

  Map<String, dynamic> toMap() {
    return WebHookRepositoryMapper._guard(
        (c) => c.toMap(this as WebHookRepository));
  }

  WebHookRepositoryCopyWith<WebHookRepository, WebHookRepository,
          WebHookRepository>
      get copyWith => _WebHookRepositoryCopyWithImpl(
          this as WebHookRepository, $identity, $identity);
  @override
  String toString() {
    return WebHookRepositoryMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookRepositoryMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookRepositoryMapper._guard((c) => c.hash(this));
  }
}

extension WebHookRepositoryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookRepository, $Out> {
  WebHookRepositoryCopyWith<$R, WebHookRepository, $Out>
      get $asWebHookRepository =>
          $base.as((v, t, t2) => _WebHookRepositoryCopyWithImpl(v, t, t2));
}

abstract class WebHookRepositoryCopyWith<$R, $In extends WebHookRepository,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? nodeId,
      String? name,
      String? fullName,
      bool? private,
      String? url});
  WebHookRepositoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _WebHookRepositoryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookRepository, $Out>
    implements WebHookRepositoryCopyWith<$R, WebHookRepository, $Out> {
  _WebHookRepositoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookRepository> $mapper =
      WebHookRepositoryMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? nodeId,
          String? name,
          String? fullName,
          bool? private,
          String? url}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (nodeId != null) #nodeId: nodeId,
        if (name != null) #name: name,
        if (fullName != null) #fullName: fullName,
        if (private != null) #private: private,
        if (url != null) #url: url
      }));
  @override
  WebHookRepository $make(CopyWithData data) => WebHookRepository(
      id: data.get(#id, or: $value.id),
      nodeId: data.get(#nodeId, or: $value.nodeId),
      name: data.get(#name, or: $value.name),
      fullName: data.get(#fullName, or: $value.fullName),
      private: data.get(#private, or: $value.private),
      url: data.get(#url, or: $value.url));

  @override
  WebHookRepositoryCopyWith<$R2, WebHookRepository, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebHookRepositoryCopyWithImpl($value, $cast, t);
}
