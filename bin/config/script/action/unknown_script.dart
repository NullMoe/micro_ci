part of '../script.dart';


@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
)
class ActionUnknownBuiltinScript extends ActionBuiltinScript with ActionUnknownBuiltinScriptMappable {
  const ActionUnknownBuiltinScript();
}
