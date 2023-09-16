import 'package:dart_mappable/dart_mappable.dart';

import 'check_status_state.dart';

part 'check_status.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
  hook: EmptyToNullHook(),
)
class CheckStatus with CheckStatusMappable {
  const CheckStatus({
    required this.state,
    this.targetUrl,
    this.description,
    this.context,
  });

  final CheckStatusState state;
  final String? targetUrl;
  final String? description;
  final String? context;
}
