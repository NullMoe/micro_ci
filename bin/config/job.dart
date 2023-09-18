import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart';

import '../job_runner/events/github_event_handler.dart';
import '../tools/split_string_once.dart';
import 'env_mode.dart';
import 'event/event.dart';
import 'on_queue.dart';
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
    this.onQueue = OnQueue.restart,
  }) : eventHandler = GitHubEventHandler(events);

  final List<Event> events;
  final List<Task> tasks;
  final OnQueue onQueue;
  final String workingDirectory;
  final String artifactsDirectory;
  final List<String> env;
  final EnvMode envMode;

  final GitHubEventHandler eventHandler;

  Map<String, String> get environmentVariables => {
    for (final pair in env)
      if (pair.splitOnce('=') case [ final key, final value, ])
        key: value,
  };

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
