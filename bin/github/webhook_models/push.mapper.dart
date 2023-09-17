// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'push.dart';

class WebHookPushMapper extends ClassMapperBase<WebHookPush> {
  WebHookPushMapper._();

  static WebHookPushMapper? _instance;
  static WebHookPushMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebHookPushMapper._());
      CommitMapper.ensureInitialized();
      AuthorMapper.ensureInitialized();
      WebHookRepositoryMapper.ensureInitialized();
      WebHookUserMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookPush';

  static String _$after(WebHookPush v) => v.after;
  static const Field<WebHookPush, String> _f$after = Field('after', _$after);
  static String? _$baseRef(WebHookPush v) => v.baseRef;
  static const Field<WebHookPush, String> _f$baseRef =
      Field('baseRef', _$baseRef, key: 'base_ref');
  static String _$before(WebHookPush v) => v.before;
  static const Field<WebHookPush, String> _f$before = Field('before', _$before);
  static List<Commit> _$commits(WebHookPush v) => v.commits;
  static const Field<WebHookPush, List<Commit>> _f$commits =
      Field('commits', _$commits);
  static String _$compare(WebHookPush v) => v.compare;
  static const Field<WebHookPush, String> _f$compare =
      Field('compare', _$compare);
  static bool _$created(WebHookPush v) => v.created;
  static const Field<WebHookPush, bool> _f$created =
      Field('created', _$created);
  static bool _$deleted(WebHookPush v) => v.deleted;
  static const Field<WebHookPush, bool> _f$deleted =
      Field('deleted', _$deleted);
  static bool _$forced(WebHookPush v) => v.forced;
  static const Field<WebHookPush, bool> _f$forced = Field('forced', _$forced);
  static Commit _$headCommit(WebHookPush v) => v.headCommit;
  static const Field<WebHookPush, Commit> _f$headCommit =
      Field('headCommit', _$headCommit, key: 'head_commit');
  static Author _$pusher(WebHookPush v) => v.pusher;
  static const Field<WebHookPush, Author> _f$pusher = Field('pusher', _$pusher);
  static String _$ref(WebHookPush v) => v.ref;
  static const Field<WebHookPush, String> _f$ref = Field('ref', _$ref);
  static WebHookRepository _$repository(WebHookPush v) => v.repository;
  static const Field<WebHookPush, WebHookRepository> _f$repository =
      Field('repository', _$repository);
  static WebHookUser? _$sender(WebHookPush v) => v.sender;
  static const Field<WebHookPush, WebHookUser> _f$sender =
      Field('sender', _$sender);

  @override
  final Map<Symbol, Field<WebHookPush, dynamic>> fields = const {
    #after: _f$after,
    #baseRef: _f$baseRef,
    #before: _f$before,
    #commits: _f$commits,
    #compare: _f$compare,
    #created: _f$created,
    #deleted: _f$deleted,
    #forced: _f$forced,
    #headCommit: _f$headCommit,
    #pusher: _f$pusher,
    #ref: _f$ref,
    #repository: _f$repository,
    #sender: _f$sender,
  };

  static WebHookPush _instantiate(DecodingData data) {
    return WebHookPush(
        after: data.dec(_f$after),
        baseRef: data.dec(_f$baseRef),
        before: data.dec(_f$before),
        commits: data.dec(_f$commits),
        compare: data.dec(_f$compare),
        created: data.dec(_f$created),
        deleted: data.dec(_f$deleted),
        forced: data.dec(_f$forced),
        headCommit: data.dec(_f$headCommit),
        pusher: data.dec(_f$pusher),
        ref: data.dec(_f$ref),
        repository: data.dec(_f$repository),
        sender: data.dec(_f$sender));
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookPush fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookPush>(map));
  }

  static WebHookPush fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookPush>(json));
  }
}

mixin WebHookPushMappable {
  String toJson() {
    return WebHookPushMapper._guard((c) => c.toJson(this as WebHookPush));
  }

  Map<String, dynamic> toMap() {
    return WebHookPushMapper._guard((c) => c.toMap(this as WebHookPush));
  }

  WebHookPushCopyWith<WebHookPush, WebHookPush, WebHookPush> get copyWith =>
      _WebHookPushCopyWithImpl(this as WebHookPush, $identity, $identity);
  @override
  String toString() {
    return WebHookPushMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookPushMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookPushMapper._guard((c) => c.hash(this));
  }
}

extension WebHookPushValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookPush, $Out> {
  WebHookPushCopyWith<$R, WebHookPush, $Out> get $asWebHookPush =>
      $base.as((v, t, t2) => _WebHookPushCopyWithImpl(v, t, t2));
}

abstract class WebHookPushCopyWith<$R, $In extends WebHookPush, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Commit, CommitCopyWith<$R, Commit, Commit>> get commits;
  CommitCopyWith<$R, Commit, Commit> get headCommit;
  AuthorCopyWith<$R, Author, Author> get pusher;
  WebHookRepositoryCopyWith<$R, WebHookRepository, WebHookRepository>
      get repository;
  WebHookUserCopyWith<$R, WebHookUser, WebHookUser>? get sender;
  $R call(
      {String? after,
      String? baseRef,
      String? before,
      List<Commit>? commits,
      String? compare,
      bool? created,
      bool? deleted,
      bool? forced,
      Commit? headCommit,
      Author? pusher,
      String? ref,
      WebHookRepository? repository,
      WebHookUser? sender});
  WebHookPushCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WebHookPushCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookPush, $Out>
    implements WebHookPushCopyWith<$R, WebHookPush, $Out> {
  _WebHookPushCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookPush> $mapper =
      WebHookPushMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Commit, CommitCopyWith<$R, Commit, Commit>> get commits =>
      ListCopyWith($value.commits, (v, t) => v.copyWith.$chain(t),
          (v) => call(commits: v));
  @override
  CommitCopyWith<$R, Commit, Commit> get headCommit =>
      $value.headCommit.copyWith.$chain((v) => call(headCommit: v));
  @override
  AuthorCopyWith<$R, Author, Author> get pusher =>
      $value.pusher.copyWith.$chain((v) => call(pusher: v));
  @override
  WebHookRepositoryCopyWith<$R, WebHookRepository, WebHookRepository>
      get repository =>
          $value.repository.copyWith.$chain((v) => call(repository: v));
  @override
  WebHookUserCopyWith<$R, WebHookUser, WebHookUser>? get sender =>
      $value.sender?.copyWith.$chain((v) => call(sender: v));
  @override
  $R call(
          {String? after,
          Object? baseRef = $none,
          String? before,
          List<Commit>? commits,
          String? compare,
          bool? created,
          bool? deleted,
          bool? forced,
          Commit? headCommit,
          Author? pusher,
          String? ref,
          WebHookRepository? repository,
          Object? sender = $none}) =>
      $apply(FieldCopyWithData({
        if (after != null) #after: after,
        if (baseRef != $none) #baseRef: baseRef,
        if (before != null) #before: before,
        if (commits != null) #commits: commits,
        if (compare != null) #compare: compare,
        if (created != null) #created: created,
        if (deleted != null) #deleted: deleted,
        if (forced != null) #forced: forced,
        if (headCommit != null) #headCommit: headCommit,
        if (pusher != null) #pusher: pusher,
        if (ref != null) #ref: ref,
        if (repository != null) #repository: repository,
        if (sender != $none) #sender: sender
      }));
  @override
  WebHookPush $make(CopyWithData data) => WebHookPush(
      after: data.get(#after, or: $value.after),
      baseRef: data.get(#baseRef, or: $value.baseRef),
      before: data.get(#before, or: $value.before),
      commits: data.get(#commits, or: $value.commits),
      compare: data.get(#compare, or: $value.compare),
      created: data.get(#created, or: $value.created),
      deleted: data.get(#deleted, or: $value.deleted),
      forced: data.get(#forced, or: $value.forced),
      headCommit: data.get(#headCommit, or: $value.headCommit),
      pusher: data.get(#pusher, or: $value.pusher),
      ref: data.get(#ref, or: $value.ref),
      repository: data.get(#repository, or: $value.repository),
      sender: data.get(#sender, or: $value.sender));

  @override
  WebHookPushCopyWith<$R2, WebHookPush, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebHookPushCopyWithImpl($value, $cast, t);
}
