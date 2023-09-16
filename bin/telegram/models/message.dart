import 'package:dart_mappable/dart_mappable.dart';

part 'message.mapper.dart';


@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class TelegramMessage with TelegramMessageMappable {
  const TelegramMessage({
    required this.id,
    required this.date,
    this.threadId,
    this.text,
  });

  factory TelegramMessage.parse(String json) =>
    TelegramMessageMapper.fromJson(json);
  static List<TelegramMessage> parseList(String json) =>
    MapperContainer.globals.fromJson(json);

  @MappableField(
    key: 'message_id',
  )
  final int id;
  @MappableField(
    key: 'message_thread_id',
  )
  final int? threadId;
  final int date;
  final String? text;
}
