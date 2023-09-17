import 'package:dart_mappable/dart_mappable.dart';

import 'repository.dart';
import 'user.dart';

part 'pull_request.mapper.dart';


@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class WebHookPullRequest with WebHookPullRequestMappable {
  const WebHookPullRequest({
    required this.url,
    required this.id,
    required this.head,
    required this.base,
  });

  final String url;
  final int id;
  final WebHookPullRequestRepositoryPointer head;
  final WebHookPullRequestRepositoryPointer base;
}

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class WebHookPullRequestRepositoryPointer with WebHookPullRequestRepositoryPointerMappable {
  const WebHookPullRequestRepositoryPointer({
    required this.label,
    required this.ref,
    required this.sha,
    required this.user,
    required this.repo,
  });

  final String label;
  final String ref;
  final String sha;
  final WebHookUser user;
  final WebHookRepository repo;
}
