// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'on_queue.dart';

class OnQueueMapper extends EnumMapper<OnQueue> {
  OnQueueMapper._();

  static OnQueueMapper? _instance;
  static OnQueueMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OnQueueMapper._());
    }
    return _instance!;
  }

  static OnQueue fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  OnQueue decode(dynamic value) {
    switch (value) {
      case 'restart':
        return OnQueue.restart;
      case 'queue':
        return OnQueue.queue;
      default:
        return OnQueue.values[1];
    }
  }

  @override
  dynamic encode(OnQueue self) {
    switch (self) {
      case OnQueue.restart:
        return 'restart';
      case OnQueue.queue:
        return 'queue';
    }
  }
}

extension OnQueueMapperExtension on OnQueue {
  String toValue() {
    OnQueueMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
