// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'payload.dart';

class WebHookPayloadMapper extends ClassMapperBase<WebHookPayload> {
  WebHookPayloadMapper._();

  static WebHookPayloadMapper? _instance;
  static WebHookPayloadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebHookPayloadMapper._());
      WebHookPushMapper.ensureInitialized();
      WebHookPullRequestReviewMapper.ensureInitialized();
      WebHookPayloadUnknownMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookPayload';

  @override
  final Map<Symbol, Field<WebHookPayload, dynamic>> fields = const {};

  static WebHookPayload _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'WebHookPayload', 'pusher', '${data.value['pusher']}');
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookPayload fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookPayload>(map));
  }

  static WebHookPayload fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookPayload>(json));
  }
}

mixin WebHookPayloadMappable {
  String toJson();
  Map<String, dynamic> toMap();
  WebHookPayloadCopyWith<WebHookPayload, WebHookPayload, WebHookPayload>
      get copyWith;
}

abstract class WebHookPayloadCopyWith<$R, $In extends WebHookPayload, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  WebHookPayloadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class WebHookPushMapper extends SubClassMapperBase<WebHookPush> {
  WebHookPushMapper._();

  static WebHookPushMapper? _instance;
  static WebHookPushMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebHookPushMapper._());
      WebHookPayloadMapper.ensureInitialized().addSubMapper(_instance!);
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

  @override
  final String discriminatorKey = 'pusher';
  @override
  final dynamic discriminatorValue = WebHookPush._isPushEvent;
  @override
  late final ClassMapperBase superMapper =
      WebHookPayloadMapper.ensureInitialized();

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
    implements WebHookPayloadCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Commit, CommitCopyWith<$R, Commit, Commit>> get commits;
  CommitCopyWith<$R, Commit, Commit> get headCommit;
  AuthorCopyWith<$R, Author, Author> get pusher;
  WebHookRepositoryCopyWith<$R, WebHookRepository, WebHookRepository>
      get repository;
  WebHookUserCopyWith<$R, WebHookUser, WebHookUser>? get sender;
  @override
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

class WebHookPullRequestReviewMapper
    extends SubClassMapperBase<WebHookPullRequestReview> {
  WebHookPullRequestReviewMapper._();

  static WebHookPullRequestReviewMapper? _instance;
  static WebHookPullRequestReviewMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WebHookPullRequestReviewMapper._());
      WebHookPayloadMapper.ensureInitialized().addSubMapper(_instance!);
      WebHookPullRequestReviewSubmittedMapper.ensureInitialized();
      WebHookPullRequestReviewUnknownMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookPullRequestReview';

  @override
  final Map<Symbol, Field<WebHookPullRequestReview, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'pusher';
  @override
  final dynamic discriminatorValue =
      WebHookPullRequestReview._isPullRequestReviewEvent;
  @override
  late final ClassMapperBase superMapper =
      WebHookPayloadMapper.ensureInitialized();

  static WebHookPullRequestReview _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'WebHookPullRequestReview', 'action', '${data.value['action']}');
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookPullRequestReview fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookPullRequestReview>(map));
  }

  static WebHookPullRequestReview fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookPullRequestReview>(json));
  }
}

mixin WebHookPullRequestReviewMappable {
  String toJson();
  Map<String, dynamic> toMap();
  WebHookPullRequestReviewCopyWith<WebHookPullRequestReview,
      WebHookPullRequestReview, WebHookPullRequestReview> get copyWith;
}

abstract class WebHookPullRequestReviewCopyWith<
    $R,
    $In extends WebHookPullRequestReview,
    $Out> implements WebHookPayloadCopyWith<$R, $In, $Out> {
  @override
  $R call();
  WebHookPullRequestReviewCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class WebHookPullRequestReviewSubmittedMapper
    extends SubClassMapperBase<WebHookPullRequestReviewSubmitted> {
  WebHookPullRequestReviewSubmittedMapper._();

  static WebHookPullRequestReviewSubmittedMapper? _instance;
  static WebHookPullRequestReviewSubmittedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WebHookPullRequestReviewSubmittedMapper._());
      WebHookPullRequestReviewMapper.ensureInitialized()
          .addSubMapper(_instance!);
      WebHookRepositoryMapper.ensureInitialized();
      WebHookReviewMapper.ensureInitialized();
      WebHookPullRequestMapper.ensureInitialized();
      WebHookUserMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookPullRequestReviewSubmitted';

  static WebHookRepository _$repository(WebHookPullRequestReviewSubmitted v) =>
      v.repository;
  static const Field<WebHookPullRequestReviewSubmitted, WebHookRepository>
      _f$repository = Field('repository', _$repository);
  static WebHookReview _$review(WebHookPullRequestReviewSubmitted v) =>
      v.review;
  static const Field<WebHookPullRequestReviewSubmitted, WebHookReview>
      _f$review = Field('review', _$review);
  static WebHookPullRequest _$pullRequest(
          WebHookPullRequestReviewSubmitted v) =>
      v.pullRequest;
  static const Field<WebHookPullRequestReviewSubmitted, WebHookPullRequest>
      _f$pullRequest = Field('pullRequest', _$pullRequest, key: 'pull_request');
  static WebHookUser _$sender(WebHookPullRequestReviewSubmitted v) => v.sender;
  static const Field<WebHookPullRequestReviewSubmitted, WebHookUser> _f$sender =
      Field('sender', _$sender);

  @override
  final Map<Symbol, Field<WebHookPullRequestReviewSubmitted, dynamic>> fields =
      const {
    #repository: _f$repository,
    #review: _f$review,
    #pullRequest: _f$pullRequest,
    #sender: _f$sender,
  };

  @override
  final String discriminatorKey = 'action';
  @override
  final dynamic discriminatorValue = 'submitted';
  @override
  late final ClassMapperBase superMapper =
      WebHookPullRequestReviewMapper.ensureInitialized();

  static WebHookPullRequestReviewSubmitted _instantiate(DecodingData data) {
    return WebHookPullRequestReviewSubmitted(
        repository: data.dec(_f$repository),
        review: data.dec(_f$review),
        pullRequest: data.dec(_f$pullRequest),
        sender: data.dec(_f$sender));
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookPullRequestReviewSubmitted fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookPullRequestReviewSubmitted>(map));
  }

  static WebHookPullRequestReviewSubmitted fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookPullRequestReviewSubmitted>(json));
  }
}

mixin WebHookPullRequestReviewSubmittedMappable {
  String toJson() {
    return WebHookPullRequestReviewSubmittedMapper._guard(
        (c) => c.toJson(this as WebHookPullRequestReviewSubmitted));
  }

  Map<String, dynamic> toMap() {
    return WebHookPullRequestReviewSubmittedMapper._guard(
        (c) => c.toMap(this as WebHookPullRequestReviewSubmitted));
  }

  WebHookPullRequestReviewSubmittedCopyWith<WebHookPullRequestReviewSubmitted,
          WebHookPullRequestReviewSubmitted, WebHookPullRequestReviewSubmitted>
      get copyWith => _WebHookPullRequestReviewSubmittedCopyWithImpl(
          this as WebHookPullRequestReviewSubmitted, $identity, $identity);
  @override
  String toString() {
    return WebHookPullRequestReviewSubmittedMapper._guard(
        (c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookPullRequestReviewSubmittedMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookPullRequestReviewSubmittedMapper._guard((c) => c.hash(this));
  }
}

extension WebHookPullRequestReviewSubmittedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookPullRequestReviewSubmitted, $Out> {
  WebHookPullRequestReviewSubmittedCopyWith<$R,
          WebHookPullRequestReviewSubmitted, $Out>
      get $asWebHookPullRequestReviewSubmitted => $base.as((v, t, t2) =>
          _WebHookPullRequestReviewSubmittedCopyWithImpl(v, t, t2));
}

abstract class WebHookPullRequestReviewSubmittedCopyWith<
    $R,
    $In extends WebHookPullRequestReviewSubmitted,
    $Out> implements WebHookPullRequestReviewCopyWith<$R, $In, $Out> {
  WebHookRepositoryCopyWith<$R, WebHookRepository, WebHookRepository>
      get repository;
  WebHookReviewCopyWith<$R, WebHookReview, WebHookReview> get review;
  WebHookPullRequestCopyWith<$R, WebHookPullRequest, WebHookPullRequest>
      get pullRequest;
  WebHookUserCopyWith<$R, WebHookUser, WebHookUser> get sender;
  @override
  $R call(
      {WebHookRepository? repository,
      WebHookReview? review,
      WebHookPullRequest? pullRequest,
      WebHookUser? sender});
  WebHookPullRequestReviewSubmittedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _WebHookPullRequestReviewSubmittedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookPullRequestReviewSubmitted, $Out>
    implements
        WebHookPullRequestReviewSubmittedCopyWith<$R,
            WebHookPullRequestReviewSubmitted, $Out> {
  _WebHookPullRequestReviewSubmittedCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookPullRequestReviewSubmitted> $mapper =
      WebHookPullRequestReviewSubmittedMapper.ensureInitialized();
  @override
  WebHookRepositoryCopyWith<$R, WebHookRepository, WebHookRepository>
      get repository =>
          $value.repository.copyWith.$chain((v) => call(repository: v));
  @override
  WebHookReviewCopyWith<$R, WebHookReview, WebHookReview> get review =>
      $value.review.copyWith.$chain((v) => call(review: v));
  @override
  WebHookPullRequestCopyWith<$R, WebHookPullRequest, WebHookPullRequest>
      get pullRequest =>
          $value.pullRequest.copyWith.$chain((v) => call(pullRequest: v));
  @override
  WebHookUserCopyWith<$R, WebHookUser, WebHookUser> get sender =>
      $value.sender.copyWith.$chain((v) => call(sender: v));
  @override
  $R call(
          {WebHookRepository? repository,
          WebHookReview? review,
          WebHookPullRequest? pullRequest,
          WebHookUser? sender}) =>
      $apply(FieldCopyWithData({
        if (repository != null) #repository: repository,
        if (review != null) #review: review,
        if (pullRequest != null) #pullRequest: pullRequest,
        if (sender != null) #sender: sender
      }));
  @override
  WebHookPullRequestReviewSubmitted $make(CopyWithData data) =>
      WebHookPullRequestReviewSubmitted(
          repository: data.get(#repository, or: $value.repository),
          review: data.get(#review, or: $value.review),
          pullRequest: data.get(#pullRequest, or: $value.pullRequest),
          sender: data.get(#sender, or: $value.sender));

  @override
  WebHookPullRequestReviewSubmittedCopyWith<$R2,
      WebHookPullRequestReviewSubmitted, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebHookPullRequestReviewSubmittedCopyWithImpl($value, $cast, t);
}

class WebHookPullRequestReviewUnknownMapper
    extends SubClassMapperBase<WebHookPullRequestReviewUnknown> {
  WebHookPullRequestReviewUnknownMapper._();

  static WebHookPullRequestReviewUnknownMapper? _instance;
  static WebHookPullRequestReviewUnknownMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WebHookPullRequestReviewUnknownMapper._());
      WebHookPullRequestReviewMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookPullRequestReviewUnknown';

  @override
  final Map<Symbol, Field<WebHookPullRequestReviewUnknown, dynamic>> fields =
      const {};

  @override
  final String discriminatorKey = 'action';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      WebHookPullRequestReviewMapper.ensureInitialized();

  static WebHookPullRequestReviewUnknown _instantiate(DecodingData data) {
    return WebHookPullRequestReviewUnknown();
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookPullRequestReviewUnknown fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookPullRequestReviewUnknown>(map));
  }

  static WebHookPullRequestReviewUnknown fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookPullRequestReviewUnknown>(json));
  }
}

mixin WebHookPullRequestReviewUnknownMappable {
  String toJson() {
    return WebHookPullRequestReviewUnknownMapper._guard(
        (c) => c.toJson(this as WebHookPullRequestReviewUnknown));
  }

  Map<String, dynamic> toMap() {
    return WebHookPullRequestReviewUnknownMapper._guard(
        (c) => c.toMap(this as WebHookPullRequestReviewUnknown));
  }

  WebHookPullRequestReviewUnknownCopyWith<WebHookPullRequestReviewUnknown,
          WebHookPullRequestReviewUnknown, WebHookPullRequestReviewUnknown>
      get copyWith => _WebHookPullRequestReviewUnknownCopyWithImpl(
          this as WebHookPullRequestReviewUnknown, $identity, $identity);
  @override
  String toString() {
    return WebHookPullRequestReviewUnknownMapper._guard(
        (c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookPullRequestReviewUnknownMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookPullRequestReviewUnknownMapper._guard((c) => c.hash(this));
  }
}

extension WebHookPullRequestReviewUnknownValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookPullRequestReviewUnknown, $Out> {
  WebHookPullRequestReviewUnknownCopyWith<$R, WebHookPullRequestReviewUnknown,
          $Out>
      get $asWebHookPullRequestReviewUnknown => $base.as(
          (v, t, t2) => _WebHookPullRequestReviewUnknownCopyWithImpl(v, t, t2));
}

abstract class WebHookPullRequestReviewUnknownCopyWith<
    $R,
    $In extends WebHookPullRequestReviewUnknown,
    $Out> implements WebHookPullRequestReviewCopyWith<$R, $In, $Out> {
  @override
  $R call();
  WebHookPullRequestReviewUnknownCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _WebHookPullRequestReviewUnknownCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookPullRequestReviewUnknown, $Out>
    implements
        WebHookPullRequestReviewUnknownCopyWith<$R,
            WebHookPullRequestReviewUnknown, $Out> {
  _WebHookPullRequestReviewUnknownCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookPullRequestReviewUnknown> $mapper =
      WebHookPullRequestReviewUnknownMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  WebHookPullRequestReviewUnknown $make(CopyWithData data) =>
      WebHookPullRequestReviewUnknown();

  @override
  WebHookPullRequestReviewUnknownCopyWith<$R2, WebHookPullRequestReviewUnknown,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebHookPullRequestReviewUnknownCopyWithImpl($value, $cast, t);
}

class WebHookPayloadUnknownMapper
    extends SubClassMapperBase<WebHookPayloadUnknown> {
  WebHookPayloadUnknownMapper._();

  static WebHookPayloadUnknownMapper? _instance;
  static WebHookPayloadUnknownMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebHookPayloadUnknownMapper._());
      WebHookPayloadMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookPayloadUnknown';

  @override
  final Map<Symbol, Field<WebHookPayloadUnknown, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'pusher';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      WebHookPayloadMapper.ensureInitialized();

  static WebHookPayloadUnknown _instantiate(DecodingData data) {
    return WebHookPayloadUnknown();
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookPayloadUnknown fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookPayloadUnknown>(map));
  }

  static WebHookPayloadUnknown fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookPayloadUnknown>(json));
  }
}

mixin WebHookPayloadUnknownMappable {
  String toJson() {
    return WebHookPayloadUnknownMapper._guard(
        (c) => c.toJson(this as WebHookPayloadUnknown));
  }

  Map<String, dynamic> toMap() {
    return WebHookPayloadUnknownMapper._guard(
        (c) => c.toMap(this as WebHookPayloadUnknown));
  }

  WebHookPayloadUnknownCopyWith<WebHookPayloadUnknown, WebHookPayloadUnknown,
          WebHookPayloadUnknown>
      get copyWith => _WebHookPayloadUnknownCopyWithImpl(
          this as WebHookPayloadUnknown, $identity, $identity);
  @override
  String toString() {
    return WebHookPayloadUnknownMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookPayloadUnknownMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookPayloadUnknownMapper._guard((c) => c.hash(this));
  }
}

extension WebHookPayloadUnknownValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookPayloadUnknown, $Out> {
  WebHookPayloadUnknownCopyWith<$R, WebHookPayloadUnknown, $Out>
      get $asWebHookPayloadUnknown =>
          $base.as((v, t, t2) => _WebHookPayloadUnknownCopyWithImpl(v, t, t2));
}

abstract class WebHookPayloadUnknownCopyWith<
    $R,
    $In extends WebHookPayloadUnknown,
    $Out> implements WebHookPayloadCopyWith<$R, $In, $Out> {
  @override
  $R call();
  WebHookPayloadUnknownCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _WebHookPayloadUnknownCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookPayloadUnknown, $Out>
    implements WebHookPayloadUnknownCopyWith<$R, WebHookPayloadUnknown, $Out> {
  _WebHookPayloadUnknownCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookPayloadUnknown> $mapper =
      WebHookPayloadUnknownMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  WebHookPayloadUnknown $make(CopyWithData data) => WebHookPayloadUnknown();

  @override
  WebHookPayloadUnknownCopyWith<$R2, WebHookPayloadUnknown, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _WebHookPayloadUnknownCopyWithImpl($value, $cast, t);
}
