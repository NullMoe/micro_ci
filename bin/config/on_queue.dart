import 'package:dart_mappable/dart_mappable.dart';

part 'on_queue.mapper.dart';


@MappableEnum(
  defaultValue: OnQueue.queue,
)
enum OnQueue {
  restart,
  queue,
}
