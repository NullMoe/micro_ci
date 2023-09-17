import 'package:dart_mappable/dart_mappable.dart';

part 'env_mode.mapper.dart';


@MappableEnum(
  defaultValue: EnvMode.inherit,
)
enum EnvMode {
  inherit,
  replace,
}
