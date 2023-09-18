import 'package:dart_mappable/dart_mappable.dart';

part 'user.mapper.dart';


@MappableClass()
class WebHookUser with WebHookUserMappable {
  WebHookUser({
    required this.login,
    required this.id,
  });

  final String login;
  final int id;
}
