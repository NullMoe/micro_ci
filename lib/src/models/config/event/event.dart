import 'package:dart_mappable/dart_mappable.dart';

import '../../../../tools/field_unwrapping_hook.dart';

part 'event.mapper.dart';
part 'events/local_review_event.dart';
part 'events/push_event.dart';


@MappableClass()
sealed class Event with EventMappable {
  const Event();

  List<String> get head;
}
