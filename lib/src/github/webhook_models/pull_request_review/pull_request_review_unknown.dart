part of '../payload.dart';


@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
)
class WebHookPullRequestReviewOther extends WebHookPullRequestReview with WebHookPullRequestReviewOtherMappable {
  const WebHookPullRequestReviewOther();

  @override
  String get fullName => throw UnimplementedError();
}
