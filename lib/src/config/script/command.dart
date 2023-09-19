part of 'script.dart';


@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
)
class Command extends Script with CommandMappable {
  const Command({
    required this.command,
  });

  final String command;
}
