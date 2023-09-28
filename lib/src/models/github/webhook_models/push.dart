part of 'payload.dart';


@MappableClass(
  discriminatorValue: WebHookPush._isPushEvent,
)
class WebHookPush extends WebHookPayload with WebHookPushMappable {
  const WebHookPush({
    required this.after,
    required this.baseRef,
    required this.before,
    required this.commits,
    required this.compare,
    required this.created,
    required this.deleted,
    required this.forced,
    required this.headCommit,
    required this.pusher,
    required this.ref,
    required this.repository,
    required this.sender,
  });

  factory WebHookPush.parse(String json) => WebHookPushMapper.fromJson(json);

  final String after;
  final String? baseRef;
  final String before;
  final List<Commit> commits;
  final String compare;
  final bool created;
  final bool deleted;
  final bool forced;
  final Commit headCommit;
  final Author pusher;
  final String ref;
  final WebHookRepository repository;
  final WebHookUser? sender;

  @override
  String get fullName => repository.fullName;
  String get branchName => ref.split('/').sublist(2).join('/');
  String get shortHash => after.substring(0, 7);

  static bool _isPushEvent(Object? value) => value is Map && value.containsKey('pusher');
}
