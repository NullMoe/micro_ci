import 'package:dart_mappable/dart_mappable.dart';

import 'list_of_strings_to_map.dart';


class ListOfStringsToMapHook extends MappingHook {
  const ListOfStringsToMapHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value == null)
      return <String, String>{};

    if (value is! List)
      throw MapperException.unexpectedType(value.runtimeType, 'List');

    return {
      for (final element in value)
        if (element is! String)
          '': throw MapperException.unexpectedType(element.runtimeType, 'String')
        else
          ...[element].splitToMap('='),
    };
  }
}
