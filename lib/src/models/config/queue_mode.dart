import 'package:dart_mappable/dart_mappable.dart';

part 'queue_mode.mapper.dart';


@MappableEnum(
  defaultValue: QueueMode.queue,
)
enum QueueMode {
  restart,
  queue,
}
