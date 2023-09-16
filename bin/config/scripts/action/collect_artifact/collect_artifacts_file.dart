import 'package:dart_mappable/dart_mappable.dart';
import 'package:path/path.dart';

import '../../../../tools/field_unwrapping_hook.dart';

part 'collect_artifacts_file.mapper.dart';


@MappableClass(
  discriminatorKey: 'file',
  hook: ActionCollectArtifactsFileHook(),
)
class ActionCollectArtifactsFile with ActionCollectArtifactsFileMappable {
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
}

@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
  hook: FieldUnwrappingHook('file'),
)
class ActionCollectArtifactsFileObject extends ActionCollectArtifactsFile with ActionCollectArtifactsFileObjectMappable {
  const ActionCollectArtifactsFileObject({
    required super.path,
    super.store,
    this.name,
    this.caption,
  });

  final String? name;
  final String? caption;
}

@MappableClass(
  discriminatorValue: null,
)
class ActionCollectArtifactsFileString extends ActionCollectArtifactsFile with ActionCollectArtifactsFileStringMappable {
  const ActionCollectArtifactsFileString({
    required super.path,
    super.store,
  });
}

// Hooks

class ActionCollectArtifactsFileHook extends MappingHook {
  const ActionCollectArtifactsFileHook();

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
