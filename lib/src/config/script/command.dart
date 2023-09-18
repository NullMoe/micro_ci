part of 'script.dart';


@MappableClass(
  discriminatorValue: null,
)
class Command extends Script with CommandMappable {
  const Command({
    required this.command,
  });

  final String command;
}

// Hooks

class CommandHook extends MappingHook {
  const CommandHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is String)
      return {
        'builtin_action': null,
        'command': value,
      };

    return value;
  }
}
