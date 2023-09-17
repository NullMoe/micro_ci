import 'package:dart_mappable/dart_mappable.dart';

part 'author_association.mapper.dart';


@MappableEnum(
  caseStyle: CaseStyle(
    tail: TextTransform.upperCase,
    separator: '_',
  ),
)
enum AuthorAssociation {
  collaborator,
  contributor,
  firstTimer,
  firstTimeContributor,
  mannequin,
  member,
  none,
  owner,
}
