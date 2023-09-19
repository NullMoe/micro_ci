import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart';

import '../../../tools/field_unwrapping_hook.dart';
import '../../github/models.dart';
import 'builtin_action/collect_artifact/collect_artifacts_file.dart';

export 'builtin_action/collect_artifact/collect_artifacts_file.dart';

part 'builtin_action/apply_check_status.dart';
part 'builtin_action/builtin_action.dart';
part 'builtin_action/collect_artifact/collect_artifacts.dart';
part 'builtin_action/telegram_message.dart';
part 'command.dart';
part 'script.mapper.dart';


@MappableClass(
  hook: ScriptHook(),
)
sealed class Script with ScriptMappable {
  const Script();
}

// Hooks

class ScriptHook extends MappingHook {
  const ScriptHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is String)
      return {
        'command': value,
      };

    return value;
  }
}
