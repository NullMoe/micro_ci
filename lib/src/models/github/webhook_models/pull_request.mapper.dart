// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'pull_request.dart';

class WebHookPullRequestMapper extends ClassMapperBase<WebHookPullRequest> {
  WebHookPullRequestMapper._();

  static WebHookPullRequestMapper? _instance;
  static WebHookPullRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebHookPullRequestMapper._());
      WebHookPullRequestRepositoryPointerMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookPullRequest';

  static String _$url(WebHookPullRequest v) => v.url;
  static const Field<WebHookPullRequest, String> _f$url = Field('url', _$url);
  static int _$id(WebHookPullRequest v) => v.id;
  static const Field<WebHookPullRequest, int> _f$id = Field('id', _$id);
  static WebHookPullRequestRepositoryPointer _$head(WebHookPullRequest v) =>
      v.head;
  static const Field<WebHookPullRequest, WebHookPullRequestRepositoryPointer>
      _f$head = Field('head', _$head);
  static WebHookPullRequestRepositoryPointer _$base(WebHookPullRequest v) =>
      v.base;
  static const Field<WebHookPullRequest, WebHookPullRequestRepositoryPointer>
      _f$base = Field('base', _$base);

  @override
  final Map<Symbol, Field<WebHookPullRequest, dynamic>> fields = const {
    #url: _f$url,
    #id: _f$id,
    #head: _f$head,
    #base: _f$base,
  };

  static WebHookPullRequest _instantiate(DecodingData data) {
    return WebHookPullRequest(
        url: data.dec(_f$url),
        id: data.dec(_f$id),
        head: data.dec(_f$head),
        base: data.dec(_f$base));
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookPullRequest fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookPullRequest>(map));
  }

  static WebHookPullRequest fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookPullRequest>(json));
  }
}

mixin WebHookPullRequestMappable {
  String toJson() {
    return WebHookPullRequestMapper._guard(
        (c) => c.toJson(this as WebHookPullRequest));
  }

  Map<String, dynamic> toMap() {
    return WebHookPullRequestMapper._guard(
        (c) => c.toMap(this as WebHookPullRequest));
  }

  WebHookPullRequestCopyWith<WebHookPullRequest, WebHookPullRequest,
          WebHookPullRequest>
      get copyWith => _WebHookPullRequestCopyWithImpl(
          this as WebHookPullRequest, $identity, $identity);
  @override
  String toString() {
    return WebHookPullRequestMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookPullRequestMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookPullRequestMapper._guard((c) => c.hash(this));
  }
}

extension WebHookPullRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookPullRequest, $Out> {
  WebHookPullRequestCopyWith<$R, WebHookPullRequest, $Out>
      get $asWebHookPullRequest =>
          $base.as((v, t, t2) => _WebHookPullRequestCopyWithImpl(v, t, t2));
}

abstract class WebHookPullRequestCopyWith<$R, $In extends WebHookPullRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  WebHookPullRequestRepositoryPointerCopyWith<
      $R,
      WebHookPullRequestRepositoryPointer,
      WebHookPullRequestRepositoryPointer> get head;
  WebHookPullRequestRepositoryPointerCopyWith<
      $R,
      WebHookPullRequestRepositoryPointer,
      WebHookPullRequestRepositoryPointer> get base;
  $R call(
      {String? url,
      int? id,
      WebHookPullRequestRepositoryPointer? head,
      WebHookPullRequestRepositoryPointer? base});
  WebHookPullRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _WebHookPullRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookPullRequest, $Out>
    implements WebHookPullRequestCopyWith<$R, WebHookPullRequest, $Out> {
  _WebHookPullRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookPullRequest> $mapper =
      WebHookPullRequestMapper.ensureInitialized();
  @override
  WebHookPullRequestRepositoryPointerCopyWith<
          $R,
          WebHookPullRequestRepositoryPointer,
          WebHookPullRequestRepositoryPointer>
      get head => $value.head.copyWith.$chain((v) => call(head: v));
  @override
  WebHookPullRequestRepositoryPointerCopyWith<
          $R,
          WebHookPullRequestRepositoryPointer,
          WebHookPullRequestRepositoryPointer>
      get base => $value.base.copyWith.$chain((v) => call(base: v));
  @override
  $R call(
          {String? url,
          int? id,
          WebHookPullRequestRepositoryPointer? head,
          WebHookPullRequestRepositoryPointer? base}) =>
      $apply(FieldCopyWithData({
        if (url != null) #url: url,
        if (id != null) #id: id,
        if (head != null) #head: head,
        if (base != null) #base: base
      }));
  @override
  WebHookPullRequest $make(CopyWithData data) => WebHookPullRequest(
      url: data.get(#url, or: $value.url),
      id: data.get(#id, or: $value.id),
      head: data.get(#head, or: $value.head),
      base: data.get(#base, or: $value.base));

  @override
  WebHookPullRequestCopyWith<$R2, WebHookPullRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebHookPullRequestCopyWithImpl($value, $cast, t);
}

class WebHookPullRequestRepositoryPointerMapper
    extends ClassMapperBase<WebHookPullRequestRepositoryPointer> {
  WebHookPullRequestRepositoryPointerMapper._();

  static WebHookPullRequestRepositoryPointerMapper? _instance;
  static WebHookPullRequestRepositoryPointerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WebHookPullRequestRepositoryPointerMapper._());
      WebHookUserMapper.ensureInitialized();
      WebHookRepositoryMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WebHookPullRequestRepositoryPointer';

  static String _$label(WebHookPullRequestRepositoryPointer v) => v.label;
  static const Field<WebHookPullRequestRepositoryPointer, String> _f$label =
      Field('label', _$label);
  static String _$ref(WebHookPullRequestRepositoryPointer v) => v.ref;
  static const Field<WebHookPullRequestRepositoryPointer, String> _f$ref =
      Field('ref', _$ref);
  static String _$sha(WebHookPullRequestRepositoryPointer v) => v.sha;
  static const Field<WebHookPullRequestRepositoryPointer, String> _f$sha =
      Field('sha', _$sha);
  static WebHookUser _$user(WebHookPullRequestRepositoryPointer v) => v.user;
  static const Field<WebHookPullRequestRepositoryPointer, WebHookUser> _f$user =
      Field('user', _$user);
  static WebHookRepository _$repo(WebHookPullRequestRepositoryPointer v) =>
      v.repo;
  static const Field<WebHookPullRequestRepositoryPointer, WebHookRepository>
      _f$repo = Field('repo', _$repo);

  @override
  final Map<Symbol, Field<WebHookPullRequestRepositoryPointer, dynamic>>
      fields = const {
    #label: _f$label,
    #ref: _f$ref,
    #sha: _f$sha,
    #user: _f$user,
    #repo: _f$repo,
  };

  static WebHookPullRequestRepositoryPointer _instantiate(DecodingData data) {
    return WebHookPullRequestRepositoryPointer(
        label: data.dec(_f$label),
        ref: data.dec(_f$ref),
        sha: data.dec(_f$sha),
        user: data.dec(_f$user),
        repo: data.dec(_f$repo));
  }

  @override
  final Function instantiate = _instantiate;

  static WebHookPullRequestRepositoryPointer fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WebHookPullRequestRepositoryPointer>(map));
  }

  static WebHookPullRequestRepositoryPointer fromJson(String json) {
    return _guard((c) => c.fromJson<WebHookPullRequestRepositoryPointer>(json));
  }
}

mixin WebHookPullRequestRepositoryPointerMappable {
  String toJson() {
    return WebHookPullRequestRepositoryPointerMapper._guard(
        (c) => c.toJson(this as WebHookPullRequestRepositoryPointer));
  }

  Map<String, dynamic> toMap() {
    return WebHookPullRequestRepositoryPointerMapper._guard(
        (c) => c.toMap(this as WebHookPullRequestRepositoryPointer));
  }

  WebHookPullRequestRepositoryPointerCopyWith<
          WebHookPullRequestRepositoryPointer,
          WebHookPullRequestRepositoryPointer,
          WebHookPullRequestRepositoryPointer>
      get copyWith => _WebHookPullRequestRepositoryPointerCopyWithImpl(
          this as WebHookPullRequestRepositoryPointer, $identity, $identity);
  @override
  String toString() {
    return WebHookPullRequestRepositoryPointerMapper._guard(
        (c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebHookPullRequestRepositoryPointerMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WebHookPullRequestRepositoryPointerMapper._guard(
        (c) => c.hash(this));
  }
}

extension WebHookPullRequestRepositoryPointerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebHookPullRequestRepositoryPointer, $Out> {
  WebHookPullRequestRepositoryPointerCopyWith<$R,
          WebHookPullRequestRepositoryPointer, $Out>
      get $asWebHookPullRequestRepositoryPointer => $base.as((v, t, t2) =>
          _WebHookPullRequestRepositoryPointerCopyWithImpl(v, t, t2));
}

abstract class WebHookPullRequestRepositoryPointerCopyWith<
    $R,
    $In extends WebHookPullRequestRepositoryPointer,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  WebHookUserCopyWith<$R, WebHookUser, WebHookUser> get user;
  WebHookRepositoryCopyWith<$R, WebHookRepository, WebHookRepository> get repo;
  $R call(
      {String? label,
      String? ref,
      String? sha,
      WebHookUser? user,
      WebHookRepository? repo});
  WebHookPullRequestRepositoryPointerCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WebHookPullRequestRepositoryPointerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebHookPullRequestRepositoryPointer, $Out>
    implements
        WebHookPullRequestRepositoryPointerCopyWith<$R,
            WebHookPullRequestRepositoryPointer, $Out> {
  _WebHookPullRequestRepositoryPointerCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebHookPullRequestRepositoryPointer> $mapper =
      WebHookPullRequestRepositoryPointerMapper.ensureInitialized();
  @override
  WebHookUserCopyWith<$R, WebHookUser, WebHookUser> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  WebHookRepositoryCopyWith<$R, WebHookRepository, WebHookRepository>
      get repo => $value.repo.copyWith.$chain((v) => call(repo: v));
  @override
  $R call(
          {String? label,
          String? ref,
          String? sha,
          WebHookUser? user,
          WebHookRepository? repo}) =>
      $apply(FieldCopyWithData({
        if (label != null) #label: label,
        if (ref != null) #ref: ref,
        if (sha != null) #sha: sha,
        if (user != null) #user: user,
        if (repo != null) #repo: repo
      }));
  @override
  WebHookPullRequestRepositoryPointer $make(CopyWithData data) =>
      WebHookPullRequestRepositoryPointer(
          label: data.get(#label, or: $value.label),
          ref: data.get(#ref, or: $value.ref),
          sha: data.get(#sha, or: $value.sha),
          user: data.get(#user, or: $value.user),
          repo: data.get(#repo, or: $value.repo));

  @override
  WebHookPullRequestRepositoryPointerCopyWith<$R2,
      WebHookPullRequestRepositoryPointer, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebHookPullRequestRepositoryPointerCopyWithImpl($value, $cast, t);
}
