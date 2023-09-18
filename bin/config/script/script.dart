import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart';

import '../../github/models.dart';
import '../../tools/field_unwrapping_hook.dart';
import 'action/collect_artifact/collect_artifacts_file.dart';

part 'action/collect_artifact/collect_artifacts.dart';
part 'action/apply_check_status.dart';
part 'action/telegram_message.dart';
part 'action/unknown_script.dart';
part 'script.mapper.dart';
part 'command.dart';
part 'action/builtin_action.dart';


@MappableClass(
  discriminatorKey: 'builtin_action',
  hook: CommandHook(),
)
sealed class Script with ScriptMappable {
  const Script();
}
