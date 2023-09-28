part of '../event.dart';


@MappableClass(
  discriminatorValue: PushEvent._isPushEvent,
  hook: FieldUnwrappingHook('push_commit'),
)
class PushEvent extends Event with PushEventMappable {
  const PushEvent({required this.head});

  @override
  final List<String> head;

  static bool _isPushEvent(Object? value) => value is Map && value.containsKey('push_commit');
}
