part of '../collect_artifacts_file.dart';


@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
  hook: FieldUnwrappingHook('file'),
)
class ActionCollectArtifactsFileObject extends ActionCollectArtifactsFile
  with ActionCollectArtifactsFileObjectMappable {
  const ActionCollectArtifactsFileObject({
    required super.path,
    super.store,
    this.name,
    this.caption,
  });

  final String? name;
  final String? caption;
}
