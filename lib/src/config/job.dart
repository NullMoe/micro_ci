import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart';

import '../../tools/list_of_strings_to_map.dart';
import 'env_mode.dart';
import 'event/event.dart';
import 'queue_mode.dart';
import 'task.dart';

part 'job.mapper.dart';


@MappableClass()
class Job with JobMappable {
  Job({
    required this.events,
    required this.tasks,
    required this.workingDirectory,
    this.artifactsDirectory = '__artifacts',
    this.env = const [],
    this.envMode = EnvMode.inherit,
    this.queueMode = QueueMode.restart,
  }) : environmentVariables = env.splitToMap('=');

  final List<Event> events;
  final List<Task> tasks;
  final QueueMode queueMode;
  final String workingDirectory;
  final String artifactsDirectory;
  final List<String> env;
  final EnvMode envMode;

  Map<String, String> environmentVariables;

  Directory get directory {
    if (isAbsolute(workingDirectory))
      return Directory(workingDirectory);

    return Directory(join(Directory.current.path, 'working_directories', workingDirectory))
      ..createSync(recursive: true);
  }

  Directory get artifacts {
    if (isAbsolute(artifactsDirectory))
      return Directory(artifactsDirectory);

    return Directory(join(directory.path, artifactsDirectory))
      ..createSync(recursive: true);
  }
}
