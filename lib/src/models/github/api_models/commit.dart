import 'package:dart_mappable/dart_mappable.dart';

import 'author.dart';

part 'commit.mapper.dart';


@MappableClass()
class Commit with CommitMappable {
  const Commit({
    required this.added,
    required this.author,
    required this.committer,
    required this.distinct,
    required this.id,
    required this.message,
    required this.modified,
    required this.removed,
    required this.timestamp,
    required this.url,
  });

  /// An array of files added in the commit.
  final List<String>? added;

  /// Metaproperties for Git author/committer information.
  final Author author;

  /// Metaproperties for Git author/committer information.
  final Author? committer;

  /// Whether this commit is distinct from any that have been pushed before.
  final String distinct;

  /// Commit SHA.
  final String id;

  /// The commit message.
  final String message;

  /// An array of files modified by the commit.
  final List<String> modified;

  /// An array of files removed in the commit.
  final List<String> removed;

  /// The ISO 8601 timestamp of the commit.
  final String timestamp;

  /// URL that points to the commit API resource.
  final String url;
}
