import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart';

import 'env_mode.dart';
import 'event.dart';
import 'on_queue.dart';
import 'task.dart';

part 'job.mapper.dart';


@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class Job with JobMappable {
  const Job({
    required this.events,
    required this.tasks,
    required this.workingDirectory,
    required this.artifactsDirectory,
    this.env = const [],
    this.envMode = EnvMode.inherit,
    this.onQueue = OnQueue.restart,
  });

  final List<Event> events;
  final List<Task> tasks;
  final OnQueue onQueue;
  final String workingDirectory;
  final String artifactsDirectory;
  final List<String> env;
  final EnvMode envMode;

  Map<String, String> get environmentVariables => {
    if (envMode == EnvMode.inherit)
      ...Platform.environment,
    ...Map.fromEntries(
      env.map((e) {
        final pair = e.split('=');
        return MapEntry(pair.first, pair.sublist(1).join('='));
      }),
    ),
  };

  Directory get ioDirectory {
    if (isAbsolute(workingDirectory))
      return Directory(workingDirectory);

    return Directory(join(Directory.current.path, 'working_directories', workingDirectory))..createSync(recursive: true);
  }

  Directory get ioArtifactsDirectory {
    if (isAbsolute(artifactsDirectory))
      return Directory(artifactsDirectory);

    return Directory(join(ioDirectory.path, artifactsDirectory))..createSync();
  }
}
