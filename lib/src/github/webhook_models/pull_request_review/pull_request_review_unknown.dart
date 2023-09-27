part of '../payload.dart';


@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
)
class WebHookPullRequestReviewUnknown extends WebHookPullRequestReview with WebHookPullRequestReviewUnknownMappable {
  const WebHookPullRequestReviewUnknown();

  @override
  String get fullName => throw UnimplementedError();
}
