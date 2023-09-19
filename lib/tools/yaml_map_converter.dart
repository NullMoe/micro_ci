import 'package:yaml/yaml.dart';


extension YamlMapConverter on YamlMap {
  Object? _convertNode(Object? value) =>
    switch (value) {
      YamlMap() => value.toMap(),
      YamlList() => [
        for (final node in value)
          _convertNode(node),
      ],
      YamlScalar() => value.value,
      _ => value,
    };

  Map<String, Object?> toMap() => {
    for (final MapEntry(:key, :value) in nodes.entries)
      (key as YamlScalar).value.toString(): _convertNode(value)
  };
}
