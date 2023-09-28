part of '../script.dart';


@MappableClass(
  discriminatorValue: ActionBuiltinScript._discriminator,
  discriminatorKey: 'name',
  hook: FieldUnwrappingHook('builtin_action'),
)
sealed class ActionBuiltinScript extends Script with ActionBuiltinScriptMappable {
  const ActionBuiltinScript();

  static bool _discriminator(Object? value) => value is Map && value.containsKey('builtin_action');
}
