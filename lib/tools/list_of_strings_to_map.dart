import 'split_string_once.dart';


extension ListOfStringsToMap on List<String> {
  Map<String, String> splitToMap(String delimiter, [ bool includeDelimiter = false, ]) => {
    for (final (index, pair) in indexed)
      if (pair.splitOnce(delimiter, includeDelimiter) case [ final key, final value, ])
        key: value
      else
        '': throw FormatException('Malformed key-value pair no. $index: $pair'),
  };
}
