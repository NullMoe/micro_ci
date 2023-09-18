// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'commit.dart';

class CommitMapper extends ClassMapperBase<Commit> {
  CommitMapper._();

  static CommitMapper? _instance;
  static CommitMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommitMapper._());
      AuthorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Commit';

  static List<String>? _$added(Commit v) => v.added;
  static const Field<Commit, List<String>> _f$added = Field('added', _$added);
  static Author _$author(Commit v) => v.author;
  static const Field<Commit, Author> _f$author = Field('author', _$author);
  static Author? _$committer(Commit v) => v.committer;
  static const Field<Commit, Author> _f$committer =
      Field('committer', _$committer);
  static String _$distinct(Commit v) => v.distinct;
  static const Field<Commit, String> _f$distinct =
      Field('distinct', _$distinct);
  static String _$id(Commit v) => v.id;
  static const Field<Commit, String> _f$id = Field('id', _$id);
  static String _$message(Commit v) => v.message;
  static const Field<Commit, String> _f$message = Field('message', _$message);
  static List<String> _$modified(Commit v) => v.modified;
  static const Field<Commit, List<String>> _f$modified =
      Field('modified', _$modified);
  static List<String> _$removed(Commit v) => v.removed;
  static const Field<Commit, List<String>> _f$removed =
      Field('removed', _$removed);
  static String _$timestamp(Commit v) => v.timestamp;
  static const Field<Commit, String> _f$timestamp =
      Field('timestamp', _$timestamp);
  static String _$url(Commit v) => v.url;
  static const Field<Commit, String> _f$url = Field('url', _$url);

  @override
  final Map<Symbol, Field<Commit, dynamic>> fields = const {
    #added: _f$added,
    #author: _f$author,
    #committer: _f$committer,
    #distinct: _f$distinct,
    #id: _f$id,
    #message: _f$message,
    #modified: _f$modified,
    #removed: _f$removed,
    #timestamp: _f$timestamp,
    #url: _f$url,
  };

  static Commit _instantiate(DecodingData data) {
    return Commit(
        added: data.dec(_f$added),
        author: data.dec(_f$author),
        committer: data.dec(_f$committer),
        distinct: data.dec(_f$distinct),
        id: data.dec(_f$id),
        message: data.dec(_f$message),
        modified: data.dec(_f$modified),
        removed: data.dec(_f$removed),
        timestamp: data.dec(_f$timestamp),
        url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static Commit fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Commit>(map));
  }

  static Commit fromJson(String json) {
    return _guard((c) => c.fromJson<Commit>(json));
  }
}

mixin CommitMappable {
  String toJson() {
    return CommitMapper._guard((c) => c.toJson(this as Commit));
  }

  Map<String, dynamic> toMap() {
    return CommitMapper._guard((c) => c.toMap(this as Commit));
  }

  CommitCopyWith<Commit, Commit, Commit> get copyWith =>
      _CommitCopyWithImpl(this as Commit, $identity, $identity);
  @override
  String toString() {
    return CommitMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CommitMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CommitMapper._guard((c) => c.hash(this));
  }
}

extension CommitValueCopy<$R, $Out> on ObjectCopyWith<$R, Commit, $Out> {
  CommitCopyWith<$R, Commit, $Out> get $asCommit =>
      $base.as((v, t, t2) => _CommitCopyWithImpl(v, t, t2));
}

abstract class CommitCopyWith<$R, $In extends Commit, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get added;
  AuthorCopyWith<$R, Author, Author> get author;
  AuthorCopyWith<$R, Author, Author>? get committer;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get modified;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get removed;
  $R call(
      {List<String>? added,
      Author? author,
      Author? committer,
      String? distinct,
      String? id,
      String? message,
      List<String>? modified,
      List<String>? removed,
      String? timestamp,
      String? url});
  CommitCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommitCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Commit, $Out>
    implements CommitCopyWith<$R, Commit, $Out> {
  _CommitCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Commit> $mapper = CommitMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get added =>
      $value.added != null
          ? ListCopyWith($value.added!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(added: v))
          : null;
  @override
  AuthorCopyWith<$R, Author, Author> get author =>
      $value.author.copyWith.$chain((v) => call(author: v));
  @override
  AuthorCopyWith<$R, Author, Author>? get committer =>
      $value.committer?.copyWith.$chain((v) => call(committer: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get modified =>
      ListCopyWith($value.modified, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(modified: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get removed =>
      ListCopyWith($value.removed, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(removed: v));
  @override
  $R call(
          {Object? added = $none,
          Author? author,
          Object? committer = $none,
          String? distinct,
          String? id,
          String? message,
          List<String>? modified,
          List<String>? removed,
          String? timestamp,
          String? url}) =>
      $apply(FieldCopyWithData({
        if (added != $none) #added: added,
        if (author != null) #author: author,
        if (committer != $none) #committer: committer,
        if (distinct != null) #distinct: distinct,
        if (id != null) #id: id,
        if (message != null) #message: message,
        if (modified != null) #modified: modified,
        if (removed != null) #removed: removed,
        if (timestamp != null) #timestamp: timestamp,
        if (url != null) #url: url
      }));
  @override
  Commit $make(CopyWithData data) => Commit(
      added: data.get(#added, or: $value.added),
      author: data.get(#author, or: $value.author),
      committer: data.get(#committer, or: $value.committer),
      distinct: data.get(#distinct, or: $value.distinct),
      id: data.get(#id, or: $value.id),
      message: data.get(#message, or: $value.message),
      modified: data.get(#modified, or: $value.modified),
      removed: data.get(#removed, or: $value.removed),
      timestamp: data.get(#timestamp, or: $value.timestamp),
      url: data.get(#url, or: $value.url));

  @override
  CommitCopyWith<$R2, Commit, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CommitCopyWithImpl($value, $cast, t);
}
