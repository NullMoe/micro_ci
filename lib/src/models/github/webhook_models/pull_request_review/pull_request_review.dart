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

  /// TODO: this is bad.
  static bool _isPullRequestReviewEvent(Object? value) => value is Map && value.containsKey('pull_request');
}
