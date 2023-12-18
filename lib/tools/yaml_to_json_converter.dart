import 'dart:convert';

import 'package:yaml/yaml.dart';


class YamlToJsonConverter extends Converter<YamlNode, dynamic> {
  const YamlToJsonConverter();

  @override
  dynamic convert(YamlNode input) => switch (input) {
    YamlScalar(:final value) => value,
    YamlMap(nodes: Map(:final entries)) => {
      for (final MapEntry(:key, :value) in entries)
        _convertToString(key as YamlNode): convert(value),
    },
    YamlList() => [
      for (final node in input.nodes)
        convert(node),
    ],
    final value => value,
  };

  String _convertToString(YamlNode input) => switch (input) {
    YamlScalar(:final String value) => value,
    _ => throw Exception('Passed map with non-string key.'),
  };
}
