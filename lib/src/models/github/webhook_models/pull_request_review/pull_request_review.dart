part of '../payload.dart';


@MappableClass(
  discriminatorKey: 'action',
  discriminatorValue: WebHookPullRequestReview._isPullRequestReviewEvent,
)
sealed class WebHookPullRequestReview extends WebHookPayload with WebHookPullRequestReviewMappable {
  const WebHookPullRequestReview();

  factory WebHookPullRequestReview.parse(String json) =>
    WebHookPullRequestReviewMapper.fromJson(json);

  @override
  String get fullName;

  /// This is bad. Edit: this is actually acceptable.
  static bool _isPullRequestReviewEvent(Object? value) => value is Map && value.containsKey('pull_request');
}
