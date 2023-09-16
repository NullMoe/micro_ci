import 'package:dart_mappable/dart_mappable.dart';

import '../tools/field_unwrapping_hook.dart';

part 'event.mapper.dart';


@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
sealed class Event with EventMappable {
  const Event();

  List<String> get head;
}

@MappableClass(
  discriminatorValue: LocalReviewEvent.isLocalReview,
  hook: FieldUnwrappingHook('local_review'),
)
class LocalReviewEvent extends Event with LocalReviewEventMappable {
  const LocalReviewEvent({
    required this.head,
    this.base = const [],
  });

  @override
  final List<String> head;
  final List<String> base;

  static bool isLocalReview(Object? value) => value is Map && value.containsKey('local_review');
}

@MappableClass(
  discriminatorValue: PushEvent.isPushEvent,
  hook: FieldUnwrappingHook('push_commit'),
)
class PushEvent extends Event with PushEventMappable {
  const PushEvent({required this.head});

  @override
  final List<String> head;

  static bool isPushEvent(Object? value) => value is Map && value.containsKey('push_commit');
}
