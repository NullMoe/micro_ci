import 'package:dart_mappable/dart_mappable.dart';

part 'check_status_state.mapper.dart';


@MappableEnum()
enum CheckStatusState {
  error,
  failure,
  pending,
  success,
}
