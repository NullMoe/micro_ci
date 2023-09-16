import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart';

import '../../github/api_models/check_status.dart';
import '../../github/github_client.dart';
import '../../tools/field_unwrapping_hook.dart';
import 'action/collect_artifact/collect_artifacts_file.dart';

part 'action/collect_artifact/collect_artifacts.dart';
part 'action/apply_check_status.dart';
part 'action/telegram_message.dart';
part 'action/unknown_script.dart';
part 'script.mapper.dart';


@MappableClass(
  caseStyle: CaseStyle.snakeCase,
  discriminatorKey: 'builtin_action',
  hook: CommandHook(),
)
sealed class Script with ScriptMappable {
  const Script();
}

@MappableClass(
  discriminatorValue: null,
)
class Command extends Script with CommandMappable {
  const Command({
    required this.command,
  });

  final String command;
}

@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
  discriminatorKey: 'name',
  hook: FieldUnwrappingHook('builtin_action'),
)
sealed class ActionBuiltinScript extends Script with ActionBuiltinScriptMappable {
  const ActionBuiltinScript();
}

// Hooks

class CommandHook extends MappingHook {
  const CommandHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is String)
      return {
        'builtin_action': null,
        'command': value,
      };

    return value;
  }
}
