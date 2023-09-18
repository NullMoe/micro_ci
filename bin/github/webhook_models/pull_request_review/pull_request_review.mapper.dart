// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'pull_request_review.dart';

class WebHookPullRequestReviewMapper
    extends ClassMapperBase<WebHookPullRequestReview> {
  WebHookPullRequestReviewMapper._();

  static WebHookPullRequestReviewMapper? _instance;
  static WebHookPullRequestReviewMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WebHookPullRequestReviewMapper._());
      WebHookPullRequestReviewSubmittedMapper.ensureInitialized();
      WebHookPullRequestReviewOtherMapper.ensureInitialized();
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
    $Out> implements ClassCopyWith<$R, $In, $Out> {
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

class WebHookPullRequestReviewOtherMapper
    extends SubClassMapperBase<WebHookPullRequestReviewOther> {
  WebHookPullRequestReviewOtherMapper._();

  static WebHookPullRequestReviewOtherMapper? _instance;
  static WebHookPullRequestReviewOtherMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WebHookPullRequestReviewOtherMapper._());
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
  final String id = 'WebHookPullRequestReviewOther';

  @override
  final Map<Symbol, Field<WebHookPullRequestReviewOther, dynamic>> fields =
      const {};

  @override
  final String discriminatorKey = 'action';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      WebHookPullRequestReviewMapper.ensureInitialized();

  static WebHookPullRequestReviewOther _instantiate(DecodingData data) {
    return WebHookPullRequestReviewOther();
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookPullRequestReviewOther fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookPullRequestReviewOther>(map));
  }

  static WebHookPullRequestReviewOther fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookPullRequestReviewOther>(json));
  }
}

mixin WebHookPullRequestReviewOtherMappable {
  String toJson() {
    return WebHookPullRequestReviewOtherMapper._guard(
        (c) => c.toJson(this as WebHookPullRequestReviewOther));
  }

  Map<String, dynamic> toMap() {
    return WebHookPullRequestReviewOtherMapper._guard(
        (c) => c.toMap(this as WebHookPullRequestReviewOther));
  }

  WebHookPullRequestReviewOtherCopyWith<WebHookPullRequestReviewOther,
          WebHookPullRequestReviewOther, WebHookPullRequestReviewOther>
      get copyWith => _WebHookPullRequestReviewOtherCopyWithImpl(
          this as WebHookPullRequestReviewOther, $identity, $identity);
  @override
  String toString() {
    return WebHookPullRequestReviewOtherMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookPullRequestReviewOtherMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookPullRequestReviewOtherMapper._guard((c) => c.hash(this));
  }
}

extension WebHookPullRequestReviewOtherValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookPullRequestReviewOther, $Out> {
  WebHookPullRequestReviewOtherCopyWith<$R, WebHookPullRequestReviewOther, $Out>
      get $asWebHookPullRequestReviewOther => $base.as(
          (v, t, t2) => _WebHookPullRequestReviewOtherCopyWithImpl(v, t, t2));
}

abstract class WebHookPullRequestReviewOtherCopyWith<
    $R,
    $In extends WebHookPullRequestReviewOther,
    $Out> implements WebHookPullRequestReviewCopyWith<$R, $In, $Out> {
  @override
  $R call();
  WebHookPullRequestReviewOtherCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _WebHookPullRequestReviewOtherCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookPullRequestReviewOther, $Out>
    implements
        WebHookPullRequestReviewOtherCopyWith<$R, WebHookPullRequestReviewOther,
            $Out> {
  _WebHookPullRequestReviewOtherCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookPullRequestReviewOther> $mapper =
      WebHookPullRequestReviewOtherMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  WebHookPullRequestReviewOther $make(CopyWithData data) =>
      WebHookPullRequestReviewOther();

  @override
  WebHookPullRequestReviewOtherCopyWith<$R2, WebHookPullRequestReviewOther,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebHookPullRequestReviewOtherCopyWithImpl($value, $cast, t);
}
