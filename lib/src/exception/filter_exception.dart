import '../../micro_ci.dart';

class FilterException extends InfoException {
  FilterException(super.message);

  @override
  String toString() => 'FilterException($message)';
}
