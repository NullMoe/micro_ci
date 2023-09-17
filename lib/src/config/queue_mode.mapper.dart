// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'queue_mode.dart';

class QueueModeMapper extends EnumMapper<QueueMode> {
  QueueModeMapper._();

  static QueueModeMapper? _instance;
  static QueueModeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QueueModeMapper._());
    }
    return _instance!;
  }

  static QueueMode fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  QueueMode decode(dynamic value) {
    switch (value) {
      case 'restart':
        return QueueMode.restart;
      case 'queue':
        return QueueMode.queue;
      default:
        return QueueMode.values[1];
    }
  }

  @override
  dynamic encode(QueueMode self) {
    switch (self) {
      case QueueMode.restart:
        return 'restart';
      case QueueMode.queue:
        return 'queue';
    }
  }
}

extension QueueModeMapperExtension on QueueMode {
  String toValue() {
    QueueModeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
