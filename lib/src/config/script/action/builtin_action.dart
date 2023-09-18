part of '../script.dart';


@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
  discriminatorKey: 'name',
  hook: FieldUnwrappingHook('builtin_action'),
)
sealed class ActionBuiltinScript extends Script with ActionBuiltinScriptMappable {
  const ActionBuiltinScript();
}
