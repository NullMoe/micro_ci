import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:micro_ci/micro_ci.dart';
import 'package:micro_ci/src/info_exception.dart';
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
  microCI.updateConfig(await configWatcher.getConfig());

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
    .listen((context) => Logger.root.info('Done:\n$context'),
      // ignore: avoid_types_on_closure_parameters
      onError: (Object error, StackTrace stackTrace) {
        switch (error) {
          case InfoException():
            Logger.root.info(error.message, error.original);
          default:
            Logger.root.severe('handleEvent $error $stackTrace');
        }
      },
    );

  return Response(200);
}

void main(List<String> args) async {
  telegramInit.initializeMappers();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: [${record.loggerName.isEmpty ? 'Global' : record.loggerName}]: ${record.message}');
  });

  microCI.updateConfig(await configWatcher.getConfig());
  configWatcher.config.listen(microCI.updateConfig,
    // ignore: avoid_types_on_closure_parameters
    onError: (Object error, StackTrace stackTrace) =>
      Logger.root.severe('configWatcher error', error, stackTrace),
  );

  await configWatcher.restartWatcher();

  final handler = const Pipeline()
    .addMiddleware((innerHandler) =>
      (req) async {
        if (req.url.queryParameters['token'] != microCI.ciToken)
          return Response(403);

        return innerHandler(req);
      },
    ).addMiddleware(
      logRequests(
        logger: (message, isError) {
          if (isError)
            Logger.root.severe(message);
          Logger.root.info(message);
        },
      ),
    ).addHandler(_router);

  final server = await serve(
    handler,
    InternetAddress.anyIPv4,
    microCI.ciPort,
  );

  Logger.root.info('Server listening on port ${server.port}.');
}
