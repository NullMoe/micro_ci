// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'event.dart';

class EventMapper extends ClassMapperBase<Event> {
  EventMapper._();

  static EventMapper? _instance;
  static EventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EventMapper._());
      LocalReviewEventMapper.ensureInitialized();
      PushEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Event';

  @override
  final Map<Symbol, Field<Event, dynamic>> fields = const {};

  static Event _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Event');
  }

  @override
  final Function instantiate = _instantiate;

  static Event fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Event>(map));
  }

  static Event fromJson(String json) {
    return _guard((c) => c.fromJson<Event>(json));
  }
}

mixin EventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  EventCopyWith<Event, Event, Event> get copyWith;
}

abstract class EventCopyWith<$R, $In extends Event, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  EventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class LocalReviewEventMapper extends SubClassMapperBase<LocalReviewEvent> {
  LocalReviewEventMapper._();

  static LocalReviewEventMapper? _instance;
  static LocalReviewEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalReviewEventMapper._());
      EventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'LocalReviewEvent';

  static List<String> _$head(LocalReviewEvent v) => v.head;
  static const Field<LocalReviewEvent, List<String>> _f$head =
      Field('head', _$head);
  static List<String> _$base(LocalReviewEvent v) => v.base;
  static const Field<LocalReviewEvent, List<String>> _f$base =
      Field('base', _$base, opt: true, def: const []);

  @override
  final Map<Symbol, Field<LocalReviewEvent, dynamic>> fields = const {
    #head: _f$head,
    #base: _f$base,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = LocalReviewEvent._isLocalReview;
  @override
  late final ClassMapperBase superMapper = EventMapper.ensureInitialized();

  @override
  final MappingHook hook = const FieldUnwrappingHook('local_review');
  static LocalReviewEvent _instantiate(DecodingData data) {
    return LocalReviewEvent(head: data.dec(_f$head), base: data.dec(_f$base));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalReviewEvent fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<LocalReviewEvent>(map));
  }

  static LocalReviewEvent fromJson(String json) {
    return _guard((c) => c.fromJson<LocalReviewEvent>(json));
  }
}

mixin LocalReviewEventMappable {
  String toJson() {
    return LocalReviewEventMapper._guard(
        (c) => c.toJson(this as LocalReviewEvent));
  }

  Map<String, dynamic> toMap() {
    return LocalReviewEventMapper._guard(
        (c) => c.toMap(this as LocalReviewEvent));
  }

  LocalReviewEventCopyWith<LocalReviewEvent, LocalReviewEvent, LocalReviewEvent>
      get copyWith => _LocalReviewEventCopyWithImpl(
          this as LocalReviewEvent, $identity, $identity);
  @override
  String toString() {
    return LocalReviewEventMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LocalReviewEventMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return LocalReviewEventMapper._guard((c) => c.hash(this));
  }
}

extension LocalReviewEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalReviewEvent, $Out> {
  LocalReviewEventCopyWith<$R, LocalReviewEvent, $Out>
      get $asLocalReviewEvent =>
          $base.as((v, t, t2) => _LocalReviewEventCopyWithImpl(v, t, t2));
}

abstract class LocalReviewEventCopyWith<$R, $In extends LocalReviewEvent, $Out>
    implements EventCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get head;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get base;
  @override
  $R call({List<String>? head, List<String>? base});
  LocalReviewEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalReviewEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalReviewEvent, $Out>
    implements LocalReviewEventCopyWith<$R, LocalReviewEvent, $Out> {
  _LocalReviewEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalReviewEvent> $mapper =
      LocalReviewEventMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get head =>
      ListCopyWith($value.head, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(head: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get base =>
      ListCopyWith($value.base, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(base: v));
  @override
  $R call({List<String>? head, List<String>? base}) => $apply(FieldCopyWithData(
      {if (head != null) #head: head, if (base != null) #base: base}));
  @override
  LocalReviewEvent $make(CopyWithData data) => LocalReviewEvent(
      head: data.get(#head, or: $value.head),
      base: data.get(#base, or: $value.base));

  @override
  LocalReviewEventCopyWith<$R2, LocalReviewEvent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocalReviewEventCopyWithImpl($value, $cast, t);
}

class PushEventMapper extends SubClassMapperBase<PushEvent> {
  PushEventMapper._();

  static PushEventMapper? _instance;
  static PushEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PushEventMapper._());
      EventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'PushEvent';

  static List<String> _$head(PushEvent v) => v.head;
  static const Field<PushEvent, List<String>> _f$head = Field('head', _$head);

  @override
  final Map<Symbol, Field<PushEvent, dynamic>> fields = const {
    #head: _f$head,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = PushEvent._isPushEvent;
  @override
  late final ClassMapperBase superMapper = EventMapper.ensureInitialized();

  @override
  final MappingHook hook = const FieldUnwrappingHook('push_commit');
  static PushEvent _instantiate(DecodingData data) {
    return PushEvent(head: data.dec(_f$head));
  }

  @override
  final Function instantiate = _instantiate;

  static PushEvent fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<PushEvent>(map));
  }

  static PushEvent fromJson(String json) {
    return _guard((c) => c.fromJson<PushEvent>(json));
  }
}

mixin PushEventMappable {
  String toJson() {
    return PushEventMapper._guard((c) => c.toJson(this as PushEvent));
  }

  Map<String, dynamic> toMap() {
    return PushEventMapper._guard((c) => c.toMap(this as PushEvent));
  }

  PushEventCopyWith<PushEvent, PushEvent, PushEvent> get copyWith =>
      _PushEventCopyWithImpl(this as PushEvent, $identity, $identity);
  @override
  String toString() {
    return PushEventMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PushEventMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PushEventMapper._guard((c) => c.hash(this));
  }
}

extension PushEventValueCopy<$R, $Out> on ObjectCopyWith<$R, PushEvent, $Out> {
  PushEventCopyWith<$R, PushEvent, $Out> get $asPushEvent =>
      $base.as((v, t, t2) => _PushEventCopyWithImpl(v, t, t2));
}

abstract class PushEventCopyWith<$R, $In extends PushEvent, $Out>
    implements EventCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get head;
  @override
  $R call({List<String>? head});
  PushEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PushEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PushEvent, $Out>
    implements PushEventCopyWith<$R, PushEvent, $Out> {
  _PushEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PushEvent> $mapper =
      PushEventMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get head =>
      ListCopyWith($value.head, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(head: v));
  @override
  $R call({List<String>? head}) =>
      $apply(FieldCopyWithData({if (head != null) #head: head}));
  @override
  PushEvent $make(CopyWithData data) =>
      PushEvent(head: data.get(#head, or: $value.head));

  @override
  PushEventCopyWith<$R2, PushEvent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PushEventCopyWithImpl($value, $cast, t);
}
