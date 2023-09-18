import 'package:dart_mappable/dart_mappable.dart';

import '../pull_request.dart';
import '../repository.dart';
import '../review.dart';
import '../user.dart';

part 'pull_request_review.mapper.dart';
part 'pull_request_review_submitted.dart';
part 'pull_request_review_unknown.dart';

@MappableClass(
  discriminatorKey: 'action',
)
sealed class WebHookPullRequestReview with WebHookPullRequestReviewMappable {
  const WebHookPullRequestReview();

  factory WebHookPullRequestReview.parse(String json) =>
    WebHookPullRequestReviewMapper.fromJson(json);
}
