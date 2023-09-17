import 'package:dart_mappable/dart_mappable.dart';

import '../../tools/list_of_strings_to_map_hook.dart';
import 'script/script.dart';

part 'task.mapper.dart';


@MappableClass()
class Task with TaskMappable {
  const Task({
    required this.name,
    required this.script,
    this.env = const {},
    this.onError = false,
    this.onAny = false,
  });

  final String name;
  final List<Script> script;
  @MappableField(
    hook: ListOfStringsToMapHook(),
  )
  final Map<String, String> env;
  final bool onError;
  final bool onAny;
}
