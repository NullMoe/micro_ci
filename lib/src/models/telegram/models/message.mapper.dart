// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'message.dart';

class TelegramMessageMapper extends ClassMapperBase<TelegramMessage> {
  TelegramMessageMapper._();

  static TelegramMessageMapper? _instance;
  static TelegramMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TelegramMessageMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'TelegramMessage';

  static int _$id(TelegramMessage v) => v.id;
  static const Field<TelegramMessage, int> _f$id =
      Field('id', _$id, key: 'message_id');
  static int _$date(TelegramMessage v) => v.date;
  static const Field<TelegramMessage, int> _f$date = Field('date', _$date);
  static int? _$threadId(TelegramMessage v) => v.threadId;
  static const Field<TelegramMessage, int> _f$threadId =
      Field('threadId', _$threadId, key: 'message_thread_id', opt: true);
  static String? _$text(TelegramMessage v) => v.text;
  static const Field<TelegramMessage, String> _f$text =
      Field('text', _$text, opt: true);

  @override
  final Map<Symbol, Field<TelegramMessage, dynamic>> fields = const {
    #id: _f$id,
    #date: _f$date,
    #threadId: _f$threadId,
    #text: _f$text,
  };

  static TelegramMessage _instantiate(DecodingData data) {
    return TelegramMessage(
        id: data.dec(_f$id),
        date: data.dec(_f$date),
        threadId: data.dec(_f$threadId),
        text: data.dec(_f$text));
  }

  @override
  final Function instantiate = _instantiate;

  static TelegramMessage fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<TelegramMessage>(map));
  }

  static TelegramMessage fromJson(String json) {
    return _guard((c) => c.fromJson<TelegramMessage>(json));
  }
}

mixin TelegramMessageMappable {
  String toJson() {
    return TelegramMessageMapper._guard(
        (c) => c.toJson(this as TelegramMessage));
  }

  Map<String, dynamic> toMap() {
    return TelegramMessageMapper._guard(
        (c) => c.toMap(this as TelegramMessage));
  }

  TelegramMessageCopyWith<TelegramMessage, TelegramMessage, TelegramMessage>
      get copyWith => _TelegramMessageCopyWithImpl(
          this as TelegramMessage, $identity, $identity);
  @override
  String toString() {
    return TelegramMessageMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TelegramMessageMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return TelegramMessageMapper._guard((c) => c.hash(this));
  }
}

extension TelegramMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TelegramMessage, $Out> {
  TelegramMessageCopyWith<$R, TelegramMessage, $Out> get $asTelegramMessage =>
      $base.as((v, t, t2) => _TelegramMessageCopyWithImpl(v, t, t2));
}

abstract class TelegramMessageCopyWith<$R, $In extends TelegramMessage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? date, int? threadId, String? text});
  TelegramMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TelegramMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TelegramMessage, $Out>
    implements TelegramMessageCopyWith<$R, TelegramMessage, $Out> {
  _TelegramMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TelegramMessage> $mapper =
      TelegramMessageMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          int? date,
          Object? threadId = $none,
          Object? text = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (date != null) #date: date,
        if (threadId != $none) #threadId: threadId,
        if (text != $none) #text: text
      }));
  @override
  TelegramMessage $make(CopyWithData data) => TelegramMessage(
      id: data.get(#id, or: $value.id),
      date: data.get(#date, or: $value.date),
      threadId: data.get(#threadId, or: $value.threadId),
      text: data.get(#text, or: $value.text));

  @override
  TelegramMessageCopyWith<$R2, TelegramMessage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TelegramMessageCopyWithImpl($value, $cast, t);
}
