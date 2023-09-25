import 'package:dart_mappable/dart_mappable.dart';

import '../../../tools/substitute_environment_variables.dart';
import 'check_status_state.dart';

part 'check_status.mapper.dart';

@MappableClass(
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

  CheckStatus substituteEnvironmentVariables(Map<String, String> env) =>
    copyWith(
      targetUrl: targetUrl?.substituteEnvironmentVariables(env),
      description: description?.substituteEnvironmentVariables(env),
      context: context?.substituteEnvironmentVariables(env),
    );
}
