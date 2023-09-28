import 'package:dart_mappable/dart_mappable.dart';

import '../models.dart';

part 'push.dart';
part 'pull_request_review/pull_request_review.dart';
part 'pull_request_review/pull_request_review_submitted.dart';
part 'pull_request_review/pull_request_review_unknown.dart';
part 'payload_unknown.dart';
part 'payload.mapper.dart';

@MappableClass(
  discriminatorKey: 'pusher',
)
sealed class WebHookPayload with WebHookPayloadMappable {
  const WebHookPayload();

  factory WebHookPayload.parse(String json) =>
    WebHookPayloadMapper.fromJson(json);

  String get fullName;
}
