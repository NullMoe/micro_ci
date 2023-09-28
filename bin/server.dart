import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:logging/logging.dart';
import 'package:micro_ci/micro_ci.dart';
import 'package:micro_ci/telegram_init.dart' as telegramInit;
import 'package:micro_ci/tools/secure_compare.dart';
import 'package:path/path.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';


final configWatcher = ConfigWatcher(
  File(join(Directory.current.path, 'config.yaml')),
);

final microCI = MicroCI();

// Configure routes.
final _apiRouter = Router()
  ..get('/api/update_config', _updateConfig)
  ..get('/api/restart_watcher', _restartWatcher);

final _ciRouter = Router()
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
  final payload = await request.readAsString();

  // Verifying signature.
  if (!request.headers.containsKey('x-hub-signature-256')) {
    Logger('micro_ci.event_handler')
      .finest('Signature was not provided in webhook event headers.');
    return Response(403);
  }

  final signature = Hmac(sha256, utf8.encode(microCI.ciToken))
    .convert(utf8.encode(payload));
  final untrusted =  request.headers['x-hub-signature-256']!;
  final trusted = 'sha256=$signature';

  if (!secureCompare(trusted, untrusted)){
    Logger('micro_ci.event_handler').warning('Signature verification failed.');
    return Response(403);
  }
  // Verifying signature end.

  final eventName = request.headers['x-github-event'];
  if (eventName == null) {
    Logger('micro_ci.event_handler')
      .finest('Event type was not provided in webhook event headers.');
    return Response(400);
  }

  try {
    await microCI.handleEvent(eventName, payload)
      .asFuture<void>()
      .timeout(const Duration(seconds: 5));
  } on TimeoutException catch (e, stackTrace) {
    MicroCI.logger.finest('Event timeout', e, stackTrace);
  } on MapperException catch (e, stackTrace) {
    MicroCI.logger.fine('Mapper failed to decode event payload.', e, stackTrace);
    return Response(400);
  } catch (e, stackTrace) {
    MicroCI.logger.severe('Exception during event handling.', e, stackTrace);
    return Response(500);
  }

  return Response(200);
}

Middleware _checkRequestToken = (innerHandler) => (req) async {
  if (req.url.queryParameters['token'] != microCI.ciToken)
    return Response(403);

  return innerHandler(req);
};

void main(List<String> args) async {
  telegramInit.initializeMappers();

  Logger.root.level = Level.LEVELS[int.parse(args.elementAtOrNull(0) ?? '4')];
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

  final apiHandler = const Pipeline()
    .addMiddleware(_checkRequestToken)
    .addMiddleware(
      logRequests(
        logger: (message, isError) {
          if (isError)
            serverLogger.severe(message);
          serverLogger.info(message);
        },
      ),
    ).addHandler(_apiRouter);

  final cascade = Cascade()
    .add(_ciRouter)
    .add(apiHandler);


  final server = await serve(
    cascade.handler,
    InternetAddress.anyIPv4,
    microCI.ciPort,
  );

  serverLogger.info('Server listening on port ${server.port}.');
}
