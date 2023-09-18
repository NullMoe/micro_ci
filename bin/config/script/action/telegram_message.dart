part of '../script.dart';


@MappableClass(
  discriminatorValue: 'tg_msg',
  hook: FieldUnwrappingHook('options'),
)
class ActionTelegramMessage extends ActionBuiltinScript with ActionTelegramMessageMappable {
  const ActionTelegramMessage({
    required this.type,
    required this.chatId,
    this.message,
    this.useReply = true,
  });

  final String type;
  final String chatId;
  final String? message;
  final bool useReply;
}
