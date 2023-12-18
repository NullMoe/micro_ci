import 'package:dart_mappable/dart_mappable.dart';

part 'repository.mapper.dart';


@MappableClass()
class WebHookRepository with WebHookRepositoryMappable {
  const WebHookRepository({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.url,
  });

  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool private;
  final String url;
}
