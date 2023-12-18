// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'review.dart';

class WebHookReviewMapper extends ClassMapperBase<WebHookReview> {
  WebHookReviewMapper._();

  static WebHookReviewMapper? _instance;
  static WebHookReviewMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebHookReviewMapper._());
      AuthorAssociationMapper.ensureInitialized();
      WebHookUserMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookReview';

  static AuthorAssociation _$authorAssociation(WebHookReview v) =>
      v.authorAssociation;
  static const Field<WebHookReview, AuthorAssociation> _f$authorAssociation =
      Field('authorAssociation', _$authorAssociation,
          key: 'author_association');
  static String _$body(WebHookReview v) => v.body;
  static const Field<WebHookReview, String> _f$body = Field('body', _$body);
  static String _$commitId(WebHookReview v) => v.commitId;
  static const Field<WebHookReview, String> _f$commitId =
      Field('commitId', _$commitId, key: 'commit_id');
  static String _$id(WebHookReview v) => v.id;
  static const Field<WebHookReview, String> _f$id = Field('id', _$id);
  static String _$nodeId(WebHookReview v) => v.nodeId;
  static const Field<WebHookReview, String> _f$nodeId =
      Field('nodeId', _$nodeId, key: 'node_id');
  static String _$pullRequestUrl(WebHookReview v) => v.pullRequestUrl;
  static const Field<WebHookReview, String> _f$pullRequestUrl =
      Field('pullRequestUrl', _$pullRequestUrl, key: 'pull_request_url');
  static String _$state(WebHookReview v) => v.state;
  static const Field<WebHookReview, String> _f$state = Field('state', _$state);
  static WebHookUser _$user(WebHookReview v) => v.user;
  static const Field<WebHookReview, WebHookUser> _f$user =
      Field('user', _$user);

  @override
  final Map<Symbol, Field<WebHookReview, dynamic>> fields = const {
    #authorAssociation: _f$authorAssociation,
    #body: _f$body,
    #commitId: _f$commitId,
    #id: _f$id,
    #nodeId: _f$nodeId,
    #pullRequestUrl: _f$pullRequestUrl,
    #state: _f$state,
    #user: _f$user,
  };

  static WebHookReview _instantiate(DecodingData data) {
    return WebHookReview(
        authorAssociation: data.dec(_f$authorAssociation),
        body: data.dec(_f$body),
        commitId: data.dec(_f$commitId),
        id: data.dec(_f$id),
        nodeId: data.dec(_f$nodeId),
        pullRequestUrl: data.dec(_f$pullRequestUrl),
        state: data.dec(_f$state),
        user: data.dec(_f$user));
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookReview fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookReview>(map));
  }

  static WebHookReview fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookReview>(json));
  }
}

mixin WebHookReviewMappable {
  String toJson() {
    return WebHookReviewMapper._guard((c) => c.toJson(this as WebHookReview));
  }

  Map<String, dynamic> toMap() {
    return WebHookReviewMapper._guard((c) => c.toMap(this as WebHookReview));
  }

  WebHookReviewCopyWith<WebHookReview, WebHookReview, WebHookReview>
      get copyWith => _WebHookReviewCopyWithImpl(
          this as WebHookReview, $identity, $identity);
  @override
  String toString() {
    return WebHookReviewMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookReviewMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookReviewMapper._guard((c) => c.hash(this));
  }
}

extension WebHookReviewValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookReview, $Out> {
  WebHookReviewCopyWith<$R, WebHookReview, $Out> get $asWebHookReview =>
      $base.as((v, t, t2) => _WebHookReviewCopyWithImpl(v, t, t2));
}

abstract class WebHookReviewCopyWith<$R, $In extends WebHookReview, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  WebHookUserCopyWith<$R, WebHookUser, WebHookUser> get user;
  $R call(
      {AuthorAssociation? authorAssociation,
      String? body,
      String? commitId,
      String? id,
      String? nodeId,
      String? pullRequestUrl,
      String? state,
      WebHookUser? user});
  WebHookReviewCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WebHookReviewCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookReview, $Out>
    implements WebHookReviewCopyWith<$R, WebHookReview, $Out> {
  _WebHookReviewCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookReview> $mapper =
      WebHookReviewMapper.ensureInitialized();
  @override
  WebHookUserCopyWith<$R, WebHookUser, WebHookUser> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call(
          {AuthorAssociation? authorAssociation,
          String? body,
          String? commitId,
          String? id,
          String? nodeId,
          String? pullRequestUrl,
          String? state,
          WebHookUser? user}) =>
      $apply(FieldCopyWithData({
        if (authorAssociation != null) #authorAssociation: authorAssociation,
        if (body != null) #body: body,
        if (commitId != null) #commitId: commitId,
        if (id != null) #id: id,
        if (nodeId != null) #nodeId: nodeId,
        if (pullRequestUrl != null) #pullRequestUrl: pullRequestUrl,
        if (state != null) #state: state,
        if (user != null) #user: user
      }));
  @override
  WebHookReview $make(CopyWithData data) => WebHookReview(
      authorAssociation:
          data.get(#authorAssociation, or: $value.authorAssociation),
      body: data.get(#body, or: $value.body),
      commitId: data.get(#commitId, or: $value.commitId),
      id: data.get(#id, or: $value.id),
      nodeId: data.get(#nodeId, or: $value.nodeId),
      pullRequestUrl: data.get(#pullRequestUrl, or: $value.pullRequestUrl),
      state: data.get(#state, or: $value.state),
      user: data.get(#user, or: $value.user));

  @override
  WebHookReviewCopyWith<$R2, WebHookReview, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebHookReviewCopyWithImpl($value, $cast, t);
}
