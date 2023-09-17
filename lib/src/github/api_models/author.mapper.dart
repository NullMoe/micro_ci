// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'author.dart';

class AuthorMapper extends ClassMapperBase<Author> {
  AuthorMapper._();

  static AuthorMapper? _instance;
  static AuthorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthorMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Author';

  static String _$name(Author v) => v.name;
  static const Field<Author, String> _f$name = Field('name', _$name);
  static String? _$date(Author v) => v.date;
  static const Field<Author, String> _f$date = Field('date', _$date, opt: true);
  static String? _$email(Author v) => v.email;
  static const Field<Author, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$username(Author v) => v.username;
  static const Field<Author, String> _f$username =
      Field('username', _$username, opt: true);

  @override
  final Map<Symbol, Field<Author, dynamic>> fields = const {
    #name: _f$name,
    #date: _f$date,
    #email: _f$email,
    #username: _f$username,
  };

  static Author _instantiate(DecodingData data) {
    return Author(
        name: data.dec(_f$name),
        date: data.dec(_f$date),
        email: data.dec(_f$email),
        username: data.dec(_f$username));
  }

  @override
  final Function instantiate = _instantiate;

  static Author fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Author>(map));
  }

  static Author fromJson(String json) {
    return _guard((c) => c.fromJson<Author>(json));
  }
}

mixin AuthorMappable {
  String toJson() {
    return AuthorMapper._guard((c) => c.toJson(this as Author));
  }

  Map<String, dynamic> toMap() {
    return AuthorMapper._guard((c) => c.toMap(this as Author));
  }

  AuthorCopyWith<Author, Author, Author> get copyWith =>
      _AuthorCopyWithImpl(this as Author, $identity, $identity);
  @override
  String toString() {
    return AuthorMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AuthorMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AuthorMapper._guard((c) => c.hash(this));
  }
}

extension AuthorValueCopy<$R, $Out> on ObjectCopyWith<$R, Author, $Out> {
  AuthorCopyWith<$R, Author, $Out> get $asAuthor =>
      $base.as((v, t, t2) => _AuthorCopyWithImpl(v, t, t2));
}

abstract class AuthorCopyWith<$R, $In extends Author, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? date, String? email, String? username});
  AuthorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthorCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Author, $Out>
    implements AuthorCopyWith<$R, Author, $Out> {
  _AuthorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Author> $mapper = AuthorMapper.ensureInitialized();
  @override
  $R call(
          {String? name,
          Object? date = $none,
          Object? email = $none,
          Object? username = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (date != $none) #date: date,
        if (email != $none) #email: email,
        if (username != $none) #username: username
      }));
  @override
  Author $make(CopyWithData data) => Author(
      name: data.get(#name, or: $value.name),
      date: data.get(#date, or: $value.date),
      email: data.get(#email, or: $value.email),
      username: data.get(#username, or: $value.username));

  @override
  AuthorCopyWith<$R2, Author, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AuthorCopyWithImpl($value, $cast, t);
}
