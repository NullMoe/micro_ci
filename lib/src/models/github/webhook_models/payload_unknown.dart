part of 'payload.dart';


@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
)
class WebHookPayloadUnknown extends WebHookPayload with WebHookPayloadUnknownMappable {
  const WebHookPayloadUnknown();

  @override
  String get fullName => throw UnimplementedError();
}
