import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:yaml/yaml.dart';

import 'config/config.dart';
import 'job_runner/run_job.dart';
import 'server_config.dart';
import 'telegram/models/message.dart';
import 'telegram/models/response.dart';

final logger = Logger();

late final ServerConfig serverConfig;

final configFile = File(join(Directory.current.path, 'config.yaml'));
late Config config;
StreamSubscription<FileSystemEvent>? watcher;

// Configure routes.
final _router = Router()
  ..get('/api/update_config', _updateConfig)
  ..get('/api/restart_watcher', _restartWatcher)
  ..post('/events', _eventHandler);

Future<Response> _updateConfig(Request req) async {
  if (!req.url.queryParameters.containsKey('token'))
    return Response(403);
  if (req.url.queryParameters['token'] != serverConfig.ciToken)
    return Response(403);

  try {
    await initializeConfig();
    stdout.writeln('update_config: Config has been updated.');
  } catch (e) {
    stderr.writeln('update_config: Unexpected error occurred.\n$e');
    return Response.internalServerError(body: e);
  }

  return Response(200);
}

Future<Response> _restartWatcher(Request req) async {
  if (!req.url.queryParameters.containsKey('token'))
    return Response(403);
  if (req.url.queryParameters['token'] != serverConfig.ciToken)
    return Response(403);

  try {
    await initializeWatcher();
    stdout.writeln('restart_watcher: Watcher has been restarted.');
  } catch (e) {
    stderr.writeln('restart_watcher: Unexpected error occurred.\n$e');
    return Response.internalServerError(body: e);
  }

  return Response(200);
}

Future<Response> _eventHandler(Request req) async {
  if (!req.url.queryParameters.containsKey('token'))
    return Response(403);
  if (req.url.queryParameters['token'] != serverConfig.ciToken)
    return Response(403);

  final eventName = req.headers['x-github-event'];
  if (eventName == null)
    return Response(400);

  final payload = await req.readAsString();

  // TODO: this should be method of Server class or something.
  for (final MapEntry(key: name, value: job) in config.jobs.entries) {
    try {
      unawaited(runJob(
        name: name,
        job: job,
        arguments: job.eventHandler.handleEvent(eventName, payload),
      ),);
    } catch (e) {
      logger.e(e);
    }
    // TODO: result is important
  }

  return Response(200);
}

Future<void> initializeConfig() async {
  final configBody = await configFile.readAsString();
  config = ConfigMapper.fromJson(jsonEncode(loadYaml(configBody)));
}

Future<void> initializeWatcher() async {
  if (watcher != null)
    await watcher?.cancel();

  watcher = Directory.current.watch(events: FileSystemEvent.modify).listen((event) async {
    if (File(event.path).absolute.path != configFile.absolute.path)
      return;

    try {
      await initializeConfig();
    } catch (e) {
      stderr.writeln('Config watcher: Invalid config.\n$e');
    }
    stdout.writeln('Config watcher: Config was updated!');
  });
}

void ensureGenericMappersInitialized() {
  TelegramMessageMapper.ensureInitialized();
  TelegramResponseMapper.ensureInitialized();
}

void main(List<String> args) async {
  serverConfig = ServerConfig.load('.env');
  ensureGenericMappersInitialized();
  await initializeConfig();
  await initializeWatcher();

  final handler = const Pipeline().addMiddleware(logRequests()).addHandler(_router);

  final server = await serve(handler, InternetAddress.anyIPv4, serverConfig.ciPort);
  print('Server listening on port ${server.port}');
}
