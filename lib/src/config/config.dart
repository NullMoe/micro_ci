import 'package:dart_mappable/dart_mappable.dart';

import 'job.dart';

part 'config.mapper.dart';


@MappableClass()
class Config with ConfigMappable {
  const Config({
    required this.version,
    required this.jobs,
  });

  final String version;
  final Map<String, Job> jobs;

  static Config parse(String json) => ConfigMapper.fromJson(json);
}
