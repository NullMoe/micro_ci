import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart';

import '../../../../../../tools/field_unwrapping_hook.dart';
import '../../../../../../tools/substitute_environment_variables.dart';

part 'collect_artifacts_file.mapper.dart';
part 'artifact_file_types/collect_artifacts_file_object.dart';
part 'artifact_file_types/collect_artifacts_file_string.dart';


@MappableClass(
  discriminatorKey: 'file',
  hook: _ActionCollectArtifactsFileHook(),
)
sealed class ActionCollectArtifactsFile with ActionCollectArtifactsFileMappable {
  const ActionCollectArtifactsFile({
    required this.path,
    this.store = false,
  });

  final String path;
  final bool store;

  String getAbsolutePath(String absoluteWorkingDirectoryPath, String absoluteArtifactDirectoryPath) {
    if (!store)
      return join(absoluteWorkingDirectoryPath, path);
    else
      return join(absoluteArtifactDirectoryPath, basename(path));
  }

  ActionCollectArtifactsFile substituteEnvironmentVariables(Map<String, String> env);
}

// Hooks

class _ActionCollectArtifactsFileHook extends MappingHook {
  const _ActionCollectArtifactsFileHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is String)
      return {
        'file': null,
        'path': value,
      };

    return value;
  }
}
