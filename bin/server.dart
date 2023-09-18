import 'dart:async';
import 'dart:io';

import 'package:micro_ci/micro_ci.dart';
import 'package:micro_ci/src/micro_ci.dart';
import 'package:path/path.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';


final microCI = MicroCI(
  configFile: File(join(Directory.current.path, 'config.yaml')),
);

// Configure routes.
final _router = Router()
  ..get('/api/update_config', _updateConfig)
  ..get('/api/restart_watcher', _restartWatcher)
  ..post('/events', _eventHandler);

Future<Response> _updateConfig(Request req) async {
  if (req.url.queryParameters['token'] != microCI.ciToken)
    return Response(403);

  await microCI.updateConfig();

  return Response(200);
}

Future<Response> _restartWatcher(Request req) async {
  if (req.url.queryParameters['token'] != microCI.ciToken)
    return Response(403);

  await microCI.updateWatcher();

  return Response(200);
}

Future<Response> _eventHandler(Request req) async {
  if (req.url.queryParameters['token'] != microCI.ciToken)
    return Response(403);

  final eventName = req.headers['x-github-event'];
  if (eventName == null)
    return Response(400);

  microCI.handleEvent(eventName, await req.readAsString());

  return Response(200);
}

void ensureGenericMappersInitialized() {
  TelegramMessageMapper.ensureInitialized();
  TelegramResponseMapper.ensureInitialized();
}

void main(List<String> args) async {
  ensureGenericMappersInitialized();

  final handler = const Pipeline()
    .addMiddleware(
      logRequests(
        logger: (message, isError) {
          if (isError)
            microCI.logger.e(message);
          microCI.logger.i(message);
        },
      ),
    ).addHandler(_router);

  final server = await serve(
    handler,
    InternetAddress.anyIPv4,
    microCI.ciPort,
  );

  microCI.logger.i('Server listening on port ${server.port}.');
}
