part of 'pull_request_review.dart';


@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
)
class WebHookPullRequestReviewOther extends WebHookPullRequestReview with WebHookPullRequestReviewOtherMappable {
  const WebHookPullRequestReviewOther();
}
