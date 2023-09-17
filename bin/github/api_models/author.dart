import 'package:dart_mappable/dart_mappable.dart';

part 'author.mapper.dart';


@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class Author with AuthorMappable{
  const Author({
    required this.date,
    required this.email,
    required this.name,
    required this.username,
  });

  final String? date;
  final String? email;
  final String name;
  final String? username;
}
