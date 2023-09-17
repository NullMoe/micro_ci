// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'env_mode.dart';

class EnvModeMapper extends EnumMapper<EnvMode> {
  EnvModeMapper._();

  static EnvModeMapper? _instance;
  static EnvModeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnvModeMapper._());
    }
    return _instance!;
  }

  static EnvMode fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  EnvMode decode(dynamic value) {
    switch (value) {
      case 'inherit':
        return EnvMode.inherit;
      case 'replace':
        return EnvMode.replace;
      default:
        return EnvMode.values[0];
    }
  }

  @override
  dynamic encode(EnvMode self) {
    switch (self) {
      case EnvMode.inherit:
        return 'inherit';
      case EnvMode.replace:
        return 'replace';
    }
  }
}

extension EnvModeMapperExtension on EnvMode {
  String toValue() {
    EnvModeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
