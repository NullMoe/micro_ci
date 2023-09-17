import 'package:dart_mappable/dart_mappable.dart';

import './scripts/script.dart';

part 'task.mapper.dart';


@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
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

  Map<String, String> get environmentVariables => {
    ...Map.fromEntries(
      env.map((e) {
        final pair = e.split('=');
        return MapEntry(pair.first, pair.sublist(1).join('='));
      }),
    ),
  };
}
