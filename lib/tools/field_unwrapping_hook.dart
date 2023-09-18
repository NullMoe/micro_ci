import 'package:dart_mappable/dart_mappable.dart';


class FieldUnwrappingHook extends MappingHook {
  const FieldUnwrappingHook(this.key);

  final String key;

  @override
  Object? beforeDecode(Object? value) {
    if (value is Map) {
      if (!value.containsKey(key))
        throw MapperException.missingParameter(key);
      return value[key];
    } else
      throw MapperException.unexpectedType(value.runtimeType, 'Map');
  }
}
