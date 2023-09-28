// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'author_association.dart';

class AuthorAssociationMapper extends EnumMapper<AuthorAssociation> {
  AuthorAssociationMapper._();

  static AuthorAssociationMapper? _instance;
  static AuthorAssociationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthorAssociationMapper._());
    }
    return _instance!;
  }

  static AuthorAssociation fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AuthorAssociation decode(dynamic value) {
    switch (value) {
      case 'COLLABORATOR':
        return AuthorAssociation.collaborator;
      case 'CONTRIBUTOR':
        return AuthorAssociation.contributor;
      case 'FIRST_TIMER':
        return AuthorAssociation.firstTimer;
      case 'FIRST_TIME_CONTRIBUTOR':
        return AuthorAssociation.firstTimeContributor;
      case 'MANNEQUIN':
        return AuthorAssociation.mannequin;
      case 'MEMBER':
        return AuthorAssociation.member;
      case 'NONE':
        return AuthorAssociation.none;
      case 'OWNER':
        return AuthorAssociation.owner;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AuthorAssociation self) {
    switch (self) {
      case AuthorAssociation.collaborator:
        return 'COLLABORATOR';
      case AuthorAssociation.contributor:
        return 'CONTRIBUTOR';
      case AuthorAssociation.firstTimer:
        return 'FIRST_TIMER';
      case AuthorAssociation.firstTimeContributor:
        return 'FIRST_TIME_CONTRIBUTOR';
      case AuthorAssociation.mannequin:
        return 'MANNEQUIN';
      case AuthorAssociation.member:
        return 'MEMBER';
      case AuthorAssociation.none:
        return 'NONE';
      case AuthorAssociation.owner:
        return 'OWNER';
    }
  }
}

extension AuthorAssociationMapperExtension on AuthorAssociation {
  String toValue() {
    AuthorAssociationMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
