// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';

import 'user.dart';

part 'review.mapper.dart';

@MappableEnum()
enum AuthorAssociation {
  COLLABORATOR,
  CONTRIBUTOR,
  FIRST_TIMER,
  FIRST_TIME_CONTRIBUTOR,
  MANNEQUIN,
  MEMBER,
  NONE,
  OWNER,
}

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class WebHookReview with WebHookReviewMappable {
  WebHookReview({
    required this.authorAssociation,
    required this.body,
    required this.commitId,
    required this.id,
    required this.nodeId,
    required this.pullRequestUrl,
    required this.state,
    required this.user,
  });

  final AuthorAssociation authorAssociation;
  final String body;
  final String commitId;
  final String id;
  final String nodeId;
  final String pullRequestUrl;
  final String state;
  final WebHookUser user;
}
