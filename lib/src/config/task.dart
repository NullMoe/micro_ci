import 'package:dart_mappable/dart_mappable.dart';

import '../../tools/list_of_strings_to_map.dart';
import 'script/script.dart';

part 'task.mapper.dart';


@MappableClass()
class Task with TaskMappable {
  Task({
    required this.name,
    required this.script,
    this.env = const [],
    this.onError = false,
    this.onAny = false,
  }) : environmentVariables = env.splitToMap('=');

  final String name;
  final List<Script> script;
  final List<String> env;
  final bool onError;
  final bool onAny;

  Map<String, String> environmentVariables;
}
