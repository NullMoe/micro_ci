import 'package:dart_mappable/dart_mappable.dart';

part 'response.mapper.dart';


@MappableClass()
class TelegramResponse<T> with TelegramResponseMappable<T> {
  const TelegramResponse({required this.ok, required this.result});

  factory TelegramResponse.parse(String json) =>
    MapperContainer.globals.fromJson<TelegramResponse<T>>(json);

  final bool ok;
  final T result;
}
