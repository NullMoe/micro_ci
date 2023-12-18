part of '../../script.dart';


@MappableClass(
  discriminatorValue: 'collect_artifacts',
  hook: FieldUnwrappingHook('options'),
)
class ActionCollectArtifacts extends ActionBuiltinScript with ActionCollectArtifactsMappable {
  const ActionCollectArtifacts({
    this.files = const [],
  });

  final List<ActionCollectArtifactsFile> files;

  Future<void> execute(Directory workingDirectory, Directory artifactStore) =>
    Future.wait([
      for (final file in files)
        if (file.store)
          File(join(workingDirectory.path, file.path))
            .copy(join(artifactStore.path, basename(file.path))),
    ]);
}
