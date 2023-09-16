import 'package:dart_mappable/dart_mappable.dart';

import 'pull_request.dart';
import 'repository.dart';
import 'review.dart';
import 'user.dart';

part 'pull_request_review.mapper.dart';


@MappableClass(
  caseStyle: CaseStyle.snakeCase,
  discriminatorKey: 'action',
)
sealed class WebHookPullRequestReview with WebHookPullRequestReviewMappable {
  const WebHookPullRequestReview();

  factory WebHookPullRequestReview.parse(String json) =>
    WebHookPullRequestReviewMapper.fromJson(json);
}

@MappableClass(
  discriminatorValue: 'submitted',
)
class WebHookPullRequestReviewSubmitted extends WebHookPullRequestReview with WebHookPullRequestReviewSubmittedMappable {
  const WebHookPullRequestReviewSubmitted({
    required this.repository,
    required this.review,
    required this.pullRequest,
    required this.sender,
  });

  final WebHookRepository repository;
  final WebHookReview review;
  final WebHookPullRequest pullRequest;
  final WebHookUser sender;
}

@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
)
class WebHookPullRequestReviewOther extends WebHookPullRequestReview with WebHookPullRequestReviewOtherMappable {
  const WebHookPullRequestReviewOther();
}
