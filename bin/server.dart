import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:micro_ci/micro_ci.dart';
import 'package:micro_ci/src/telegram/models.init.dart' as telegramInit;
import 'package:path/path.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';


final configWatcher = ConfigWatcher(
  File(join(Directory.current.path, 'config.yaml')),
);

final microCI = MicroCI();

// Configure routes.
final _router = Router()
  ..get('/api/update_config', _updateConfig)
  ..get('/api/restart_watcher', _restartWatcher)
  ..post('/events', _eventHandler);

Future<Response> _updateConfig(Request req) async {
  try {
    microCI.updateConfig(await configWatcher.getConfig());
  } catch (e, stackTrace) {
    MicroCI.logger.severe('Error while updating config', e, stackTrace);
    return Response(500);
  }

  return Response(200);
}

Future<Response> _restartWatcher(Request req) async {
  await configWatcher.restartWatcher();

  return Response(200);
}

Future<Response> _eventHandler(Request request) async {
  final eventName = request.headers['x-github-event'];
  if (eventName == null)
    return Response(400);

  microCI.handleEvent(eventName, request)
    .listen((context) => MicroCI.logger.fine('Job results:\n$context'),
      // ignore: avoid_types_on_closure_parameters
      onError: (Object error, StackTrace stackTrace) {
        switch (error) {
          case InfoException():
            MicroCI.logger.info(error.message, error.original);
          default:
            MicroCI.logger.severe('Error while handling event', error, stackTrace);
        }
      },
    );

  return Response(200);
}

Middleware _checkRequestToken = (innerHandler) => (req) async {
  if (req.url.queryParameters['token'] != microCI.ciToken)
    return Response(403);

  return innerHandler(req);
};

void main(List<String> args) async {
  telegramInit.initializeMappers();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: [${record.loggerName}]: ${record.message}');
    if (record.error != null)
      print(record.error);
    if (record.stackTrace != null)
      print(record.stackTrace);
  });

  microCI.updateConfig(await configWatcher.getConfig());
  configWatcher.config.listen(microCI.updateConfig,
    // ignore: avoid_types_on_closure_parameters
    onError: (Object error, StackTrace stackTrace) =>
      ConfigWatcher.logger.severe('', error, stackTrace),
  );

  await configWatcher.restartWatcher();

  final serverLogger = Logger('micro_ci.server');

  final handler = const Pipeline()
    .addMiddleware(_checkRequestToken)
    .addMiddleware(
      logRequests(
        logger: (message, isError) {
          if (isError)
            serverLogger.severe(message);
          serverLogger.info(message);
        },
      ),
    ).addHandler(_router);

  final server = await serve(
    handler,
    InternetAddress.anyIPv4,
    microCI.ciPort,
  );

  serverLogger.info('Server listening on port ${server.port}.');
}
