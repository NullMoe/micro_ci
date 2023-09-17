part of '../script.dart';


@MappableClass(
  discriminatorValue: 'apply_check_status',
  hook: FieldUnwrappingHook('options'),
)
class ActionApplyCheckStatus extends ActionBuiltinScript with ActionApplyCheckStatusMappable {
  const ActionApplyCheckStatus({
    required this.checkStatus,
  });

  final CheckStatus checkStatus;
}
