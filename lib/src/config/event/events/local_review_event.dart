part of '../event.dart';


@MappableClass(
  discriminatorValue: LocalReviewEvent._isLocalReview,
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

  static bool _isLocalReview(Object? value) => value is Map && value.containsKey('local_review');
}
