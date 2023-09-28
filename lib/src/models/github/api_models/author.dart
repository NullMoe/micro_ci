import 'package:dart_mappable/dart_mappable.dart';

part 'author.mapper.dart';


@MappableClass()
class Author with AuthorMappable{
  const Author({
    required this.name,
    this.date,
    this.email,
    this.username,
  });

  final String name;
  final String? date;
  final String? email;
  final String? username;
}
