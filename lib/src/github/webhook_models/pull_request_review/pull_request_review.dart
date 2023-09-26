part of '../payload.dart';


@MappableClass(
  discriminatorKey: 'action',
  discriminatorValue: MappableClass.useAsDefault,
)
sealed class WebHookPullRequestReview extends WebHookPayload with WebHookPullRequestReviewMappable {
  const WebHookPullRequestReview();

  factory WebHookPullRequestReview.parse(String json) =>
    WebHookPullRequestReviewMapper.fromJson(json);

  @override
  String get fullName;
}
