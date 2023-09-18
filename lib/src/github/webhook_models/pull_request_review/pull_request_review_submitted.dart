part of 'pull_request_review.dart';


@MappableClass(
  discriminatorValue: 'submitted',
)
class WebHookPullRequestReviewSubmitted extends WebHookPullRequestReview
  with WebHookPullRequestReviewSubmittedMappable {
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
