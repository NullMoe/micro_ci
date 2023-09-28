// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'check_status_state.dart';

class CheckStatusStateMapper extends EnumMapper<CheckStatusState> {
  CheckStatusStateMapper._();

  static CheckStatusStateMapper? _instance;
  static CheckStatusStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CheckStatusStateMapper._());
    }
    return _instance!;
  }

  static CheckStatusState fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CheckStatusState decode(dynamic value) {
    switch (value) {
      case 'error':
        return CheckStatusState.error;
      case 'failure':
        return CheckStatusState.failure;
      case 'pending':
        return CheckStatusState.pending;
      case 'success':
        return CheckStatusState.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CheckStatusState self) {
    switch (self) {
      case CheckStatusState.error:
        return 'error';
      case CheckStatusState.failure:
        return 'failure';
      case CheckStatusState.pending:
        return 'pending';
      case CheckStatusState.success:
        return 'success';
    }
  }
}

extension CheckStatusStateMapperExtension on CheckStatusState {
  String toValue() {
    CheckStatusStateMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
