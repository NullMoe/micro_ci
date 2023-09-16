import 'package:glob/glob.dart';

bool checkList<E>(Iterable<E> list, String match, String Function(E) prop) {
  for (final e in list) {
    if (Glob(prop(e)).matches(match))
      return true;
  }

  return false;
}
