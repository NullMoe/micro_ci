// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'collect_artifacts_file.dart';

class ActionCollectArtifactsFileMapper
    extends ClassMapperBase<ActionCollectArtifactsFile> {
  ActionCollectArtifactsFileMapper._();

  static ActionCollectArtifactsFileMapper? _instance;
  static ActionCollectArtifactsFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ActionCollectArtifactsFileMapper._());
      ActionCollectArtifactsFileObjectMapper.ensureInitialized();
      ActionCollectArtifactsFileStringMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ActionCollectArtifactsFile';

  static String _$path(ActionCollectArtifactsFile v) => v.path;
  static const Field<ActionCollectArtifactsFile, String> _f$path =
      Field('path', _$path);
  static bool _$store(ActionCollectArtifactsFile v) => v.store;
  static const Field<ActionCollectArtifactsFile, bool> _f$store =
      Field('store', _$store, opt: true, def: false);

  @override
  final Map<Symbol, Field<ActionCollectArtifactsFile, dynamic>> fields = const {
    #path: _f$path,
    #store: _f$store,
  };

  @override
  final MappingHook hook = const _ActionCollectArtifactsFileHook();
  static ActionCollectArtifactsFile _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'ActionCollectArtifactsFile', 'file', '${data.value['file']}');
  }

  @override
  final Function instantiate = _instantiate;

  static ActionCollectArtifactsFile fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ActionCollectArtifactsFile>(map));
  }

  static ActionCollectArtifactsFile fromJson(String json) {
    return _guard((c) => c.fromJson<ActionCollectArtifactsFile>(json));
  }
}

mixin ActionCollectArtifactsFileMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ActionCollectArtifactsFileCopyWith<ActionCollectArtifactsFile,
      ActionCollectArtifactsFile, ActionCollectArtifactsFile> get copyWith;
}

abstract class ActionCollectArtifactsFileCopyWith<
    $R,
    $In extends ActionCollectArtifactsFile,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? path, bool? store});
  ActionCollectArtifactsFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class ActionCollectArtifactsFileObjectMapper
    extends SubClassMapperBase<ActionCollectArtifactsFileObject> {
  ActionCollectArtifactsFileObjectMapper._();

  static ActionCollectArtifactsFileObjectMapper? _instance;
  static ActionCollectArtifactsFileObjectMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ActionCollectArtifactsFileObjectMapper._());
      ActionCollectArtifactsFileMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ActionCollectArtifactsFileObject';

  static String _$path(ActionCollectArtifactsFileObject v) => v.path;
  static const Field<ActionCollectArtifactsFileObject, String> _f$path =
      Field('path', _$path);
  static bool _$store(ActionCollectArtifactsFileObject v) => v.store;
  static const Field<ActionCollectArtifactsFileObject, bool> _f$store =
      Field('store', _$store, opt: true, def: false);
  static String? _$name(ActionCollectArtifactsFileObject v) => v.name;
  static const Field<ActionCollectArtifactsFileObject, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$caption(ActionCollectArtifactsFileObject v) => v.caption;
  static const Field<ActionCollectArtifactsFileObject, String> _f$caption =
      Field('caption', _$caption, opt: true);

  @override
  final Map<Symbol, Field<ActionCollectArtifactsFileObject, dynamic>> fields =
      const {
    #path: _f$path,
    #store: _f$store,
    #name: _f$name,
    #caption: _f$caption,
  };

  @override
  final String discriminatorKey = 'file';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      ActionCollectArtifactsFileMapper.ensureInitialized();

  @override
  final MappingHook hook = const FieldUnwrappingHook('file');
  @override
  final MappingHook superHook = const _ActionCollectArtifactsFileHook();

  static ActionCollectArtifactsFileObject _instantiate(DecodingData data) {
    return ActionCollectArtifactsFileObject(
        path: data.dec(_f$path),
        store: data.dec(_f$store),
        name: data.dec(_f$name),
        caption: data.dec(_f$caption));
  }

  @override
  final Function instantiate = _instantiate;

  static ActionCollectArtifactsFileObject fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ActionCollectArtifactsFileObject>(map));
  }

  static ActionCollectArtifactsFileObject fromJson(String json) {
    return _guard((c) => c.fromJson<ActionCollectArtifactsFileObject>(json));
  }
}

mixin ActionCollectArtifactsFileObjectMappable {
  String toJson() {
    return ActionCollectArtifactsFileObjectMapper._guard(
        (c) => c.toJson(this as ActionCollectArtifactsFileObject));
  }

  Map<String, dynamic> toMap() {
    return ActionCollectArtifactsFileObjectMapper._guard(
        (c) => c.toMap(this as ActionCollectArtifactsFileObject));
  }

  ActionCollectArtifactsFileObjectCopyWith<ActionCollectArtifactsFileObject,
          ActionCollectArtifactsFileObject, ActionCollectArtifactsFileObject>
      get copyWith => _ActionCollectArtifactsFileObjectCopyWithImpl(
          this as ActionCollectArtifactsFileObject, $identity, $identity);
  @override
  String toString() {
    return ActionCollectArtifactsFileObjectMapper._guard(
        (c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ActionCollectArtifactsFileObjectMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ActionCollectArtifactsFileObjectMapper._guard((c) => c.hash(this));
  }
}

extension ActionCollectArtifactsFileObjectValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActionCollectArtifactsFileObject, $Out> {
  ActionCollectArtifactsFileObjectCopyWith<$R, ActionCollectArtifactsFileObject,
          $Out>
      get $asActionCollectArtifactsFileObject => $base.as((v, t, t2) =>
          _ActionCollectArtifactsFileObjectCopyWithImpl(v, t, t2));
}

abstract class ActionCollectArtifactsFileObjectCopyWith<
    $R,
    $In extends ActionCollectArtifactsFileObject,
    $Out> implements ActionCollectArtifactsFileCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path, bool? store, String? name, String? caption});
  ActionCollectArtifactsFileObjectCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActionCollectArtifactsFileObjectCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActionCollectArtifactsFileObject, $Out>
    implements
        ActionCollectArtifactsFileObjectCopyWith<$R,
            ActionCollectArtifactsFileObject, $Out> {
  _ActionCollectArtifactsFileObjectCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActionCollectArtifactsFileObject> $mapper =
      ActionCollectArtifactsFileObjectMapper.ensureInitialized();
  @override
  $R call(
          {String? path,
          bool? store,
          Object? name = $none,
          Object? caption = $none}) =>
      $apply(FieldCopyWithData({
        if (path != null) #path: path,
        if (store != null) #store: store,
        if (name != $none) #name: name,
        if (caption != $none) #caption: caption
      }));
  @override
  ActionCollectArtifactsFileObject $make(CopyWithData data) =>
      ActionCollectArtifactsFileObject(
          path: data.get(#path, or: $value.path),
          store: data.get(#store, or: $value.store),
          name: data.get(#name, or: $value.name),
          caption: data.get(#caption, or: $value.caption));

  @override
  ActionCollectArtifactsFileObjectCopyWith<$R2,
      ActionCollectArtifactsFileObject, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ActionCollectArtifactsFileObjectCopyWithImpl($value, $cast, t);
}

class ActionCollectArtifactsFileStringMapper
    extends SubClassMapperBase<ActionCollectArtifactsFileString> {
  ActionCollectArtifactsFileStringMapper._();

  static ActionCollectArtifactsFileStringMapper? _instance;
  static ActionCollectArtifactsFileStringMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ActionCollectArtifactsFileStringMapper._());
      ActionCollectArtifactsFileMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ActionCollectArtifactsFileString';

  static String _$path(ActionCollectArtifactsFileString v) => v.path;
  static const Field<ActionCollectArtifactsFileString, String> _f$path =
      Field('path', _$path);
  static bool _$store(ActionCollectArtifactsFileString v) => v.store;
  static const Field<ActionCollectArtifactsFileString, bool> _f$store =
      Field('store', _$store, opt: true, def: false);

  @override
  final Map<Symbol, Field<ActionCollectArtifactsFileString, dynamic>> fields =
      const {
    #path: _f$path,
    #store: _f$store,
  };

  @override
  final String discriminatorKey = 'file';
  @override
  final dynamic discriminatorValue = null;
  @override
  late final ClassMapperBase superMapper =
      ActionCollectArtifactsFileMapper.ensureInitialized();

  @override
  final MappingHook superHook = const _ActionCollectArtifactsFileHook();

  static ActionCollectArtifactsFileString _instantiate(DecodingData data) {
    return ActionCollectArtifactsFileString(
        path: data.dec(_f$path), store: data.dec(_f$store));
  }

  @override
  final Function instantiate = _instantiate;

  static ActionCollectArtifactsFileString fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ActionCollectArtifactsFileString>(map));
  }

  static ActionCollectArtifactsFileString fromJson(String json) {
    return _guard((c) => c.fromJson<ActionCollectArtifactsFileString>(json));
  }
}

mixin ActionCollectArtifactsFileStringMappable {
  String toJson() {
    return ActionCollectArtifactsFileStringMapper._guard(
        (c) => c.toJson(this as ActionCollectArtifactsFileString));
  }

  Map<String, dynamic> toMap() {
    return ActionCollectArtifactsFileStringMapper._guard(
        (c) => c.toMap(this as ActionCollectArtifactsFileString));
  }

  ActionCollectArtifactsFileStringCopyWith<ActionCollectArtifactsFileString,
          ActionCollectArtifactsFileString, ActionCollectArtifactsFileString>
      get copyWith => _ActionCollectArtifactsFileStringCopyWithImpl(
          this as ActionCollectArtifactsFileString, $identity, $identity);
  @override
  String toString() {
    return ActionCollectArtifactsFileStringMapper._guard(
        (c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ActionCollectArtifactsFileStringMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ActionCollectArtifactsFileStringMapper._guard((c) => c.hash(this));
  }
}

extension ActionCollectArtifactsFileStringValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActionCollectArtifactsFileString, $Out> {
  ActionCollectArtifactsFileStringCopyWith<$R, ActionCollectArtifactsFileString,
          $Out>
      get $asActionCollectArtifactsFileString => $base.as((v, t, t2) =>
          _ActionCollectArtifactsFileStringCopyWithImpl(v, t, t2));
}

abstract class ActionCollectArtifactsFileStringCopyWith<
    $R,
    $In extends ActionCollectArtifactsFileString,
    $Out> implements ActionCollectArtifactsFileCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path, bool? store});
  ActionCollectArtifactsFileStringCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActionCollectArtifactsFileStringCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActionCollectArtifactsFileString, $Out>
    implements
        ActionCollectArtifactsFileStringCopyWith<$R,
            ActionCollectArtifactsFileString, $Out> {
  _ActionCollectArtifactsFileStringCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActionCollectArtifactsFileString> $mapper =
      ActionCollectArtifactsFileStringMapper.ensureInitialized();
  @override
  $R call({String? path, bool? store}) => $apply(FieldCopyWithData(
      {if (path != null) #path: path, if (store != null) #store: store}));
  @override
  ActionCollectArtifactsFileString $make(CopyWithData data) =>
      ActionCollectArtifactsFileString(
          path: data.get(#path, or: $value.path),
          store: data.get(#store, or: $value.store));

  @override
  ActionCollectArtifactsFileStringCopyWith<$R2,
      ActionCollectArtifactsFileString, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ActionCollectArtifactsFileStringCopyWithImpl($value, $cast, t);
}
