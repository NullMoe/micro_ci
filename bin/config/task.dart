import 'package:dart_mappable/dart_mappable.dart';

import '../tools/split_string_once.dart';
import 'script/script.dart';

part 'task.mapper.dart';


@MappableClass()
class Task with TaskMappable {
  const Task({
    required this.name,
    required this.script,
    this.env = const [],
    this.onError = false,
    this.onAny = false,
  });

  final String name;
  final List<Script> script;
  final List<String> env;
  final bool onError;
  final bool onAny;
}
