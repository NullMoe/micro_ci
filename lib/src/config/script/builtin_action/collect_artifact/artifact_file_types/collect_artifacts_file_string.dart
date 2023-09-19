part of '../collect_artifacts_file.dart';


@MappableClass(
  discriminatorValue: null,
)
class ActionCollectArtifactsFileString extends ActionCollectArtifactsFile
  with ActionCollectArtifactsFileStringMappable {
  const ActionCollectArtifactsFileString({
    required super.path,
    super.store,
  });
}
