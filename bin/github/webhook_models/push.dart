import 'package:dart_mappable/dart_mappable.dart';

import '../api_models/author.dart';
import '../api_models/check_status.dart';
import '../api_models/commit.dart';
import '../github_client.dart';
import 'repository.dart';
import 'user.dart';

part 'push.mapper.dart';


@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class WebHookPush with WebHookPushMappable {
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

  Future<String> setStatus(GitHubClient client, CheckStatus status) =>
    client.createCommitStatus(repository.fullName, after, status);

  String get branchName => ref.split('/').sublist(2).join('/');
}
