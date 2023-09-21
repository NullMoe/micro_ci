import 'dart:async';
import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

import '../tools/yaml_map_converter.dart';
import 'config/config.dart';

class ConfigWatcher {
  ConfigWatcher(this.configFile) :
    _configController = StreamController<Config>();

  static final Logger logger = Logger('micro_ci.config_watcher');

  final File configFile;
  final StreamController<Config> _configController;
  late Stream<Config> config = _configController.stream;

  StreamSubscription<FileSystemEvent>? _watcher;

  Future<Config> getConfig() async {
    final yaml = loadYaml(await configFile.readAsString());

    if (yaml is! YamlMap)
      throw MapperException.unexpectedType(yaml.runtimeType, 'YamlMap');

    return ConfigMapper.fromMap(yaml.toMap());
  }

  FutureOr<void> _watcherUpdateConfig(FileSystemEvent event) {
    if (File(event.path).absolute.path != configFile.absolute.path)
      return null;

    logger.config('${configFile.path} was updated.');
    return getConfig()
      .then(_configController.add, onError: _configController.addError);
  }

  Future<void> restartWatcher() async {
    logger.config('Updating "${basename(configFile.path)}" file\'s watcher.');

    if (_watcher != null)
      await _watcher!.cancel();

    _watcher = configFile.parent.watch(
      events: FileSystemEvent.modify,
    ).listen(_watcherUpdateConfig);
  }

  Future<void> close() => _configController.close();
}
