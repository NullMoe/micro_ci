// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'script.dart';

class ScriptMapper extends ClassMapperBase<Script> {
  ScriptMapper._();

  static ScriptMapper? _instance;
  static ScriptMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScriptMapper._());
      ActionBuiltinScriptMapper.ensureInitialized();
      CommandMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Script';

  @override
  final Map<Symbol, Field<Script, dynamic>> fields = const {};

  @override
  final MappingHook hook = const ScriptHook();
  static Script _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Script');
  }

  @override
  final Function instantiate = _instantiate;

  static Script fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Script>(map));
  }

  static Script fromJson(String json) {
    return _guard((c) => c.fromJson<Script>(json));
  }
}

mixin ScriptMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ScriptCopyWith<Script, Script, Script> get copyWith;
}

abstract class ScriptCopyWith<$R, $In extends Script, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ScriptCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class ActionBuiltinScriptMapper
    extends SubClassMapperBase<ActionBuiltinScript> {
  ActionBuiltinScriptMapper._();

  static ActionBuiltinScriptMapper? _instance;
  static ActionBuiltinScriptMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActionBuiltinScriptMapper._());
      ScriptMapper.ensureInitialized().addSubMapper(_instance!);
      ActionApplyCheckStatusMapper.ensureInitialized();
      ActionCollectArtifactsMapper.ensureInitialized();
      ActionTelegramMessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ActionBuiltinScript';

  @override
  final Map<Symbol, Field<ActionBuiltinScript, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = ActionBuiltinScript._discriminator;
  @override
  late final ClassMapperBase superMapper = ScriptMapper.ensureInitialized();

  @override
  final MappingHook hook = const FieldUnwrappingHook('builtin_action');
  @override
  final MappingHook superHook = const ScriptHook();

  static ActionBuiltinScript _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'ActionBuiltinScript', 'name', '${data.value['name']}');
  }

  @override
  final Function instantiate = _instantiate;

  static ActionBuiltinScript fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ActionBuiltinScript>(map));
  }

  static ActionBuiltinScript fromJson(String json) {
    return _guard((c) => c.fromJson<ActionBuiltinScript>(json));
  }
}

mixin ActionBuiltinScriptMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ActionBuiltinScriptCopyWith<ActionBuiltinScript, ActionBuiltinScript,
      ActionBuiltinScript> get copyWith;
}

abstract class ActionBuiltinScriptCopyWith<$R, $In extends ActionBuiltinScript,
    $Out> implements ScriptCopyWith<$R, $In, $Out> {
  @override
  $R call();
  ActionBuiltinScriptCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class CommandMapper extends SubClassMapperBase<Command> {
  CommandMapper._();

  static CommandMapper? _instance;
  static CommandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommandMapper._());
      ScriptMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Command';

  static String _$command(Command v) => v.command;
  static const Field<Command, String> _f$command = Field('command', _$command);

  @override
  final Map<Symbol, Field<Command, dynamic>> fields = const {
    #command: _f$command,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper = ScriptMapper.ensureInitialized();

  @override
  final MappingHook superHook = const ScriptHook();

  static Command _instantiate(DecodingData data) {
    return Command(command: data.dec(_f$command));
  }

  @override
  final Function instantiate = _instantiate;

  static Command fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Command>(map));
  }

  static Command fromJson(String json) {
    return _guard((c) => c.fromJson<Command>(json));
  }
}

mixin CommandMappable {
  String toJson() {
    return CommandMapper._guard((c) => c.toJson(this as Command));
  }

  Map<String, dynamic> toMap() {
    return CommandMapper._guard((c) => c.toMap(this as Command));
  }

  CommandCopyWith<Command, Command, Command> get copyWith =>
      _CommandCopyWithImpl(this as Command, $identity, $identity);
  @override
  String toString() {
    return CommandMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CommandMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CommandMapper._guard((c) => c.hash(this));
  }
}

extension CommandValueCopy<$R, $Out> on ObjectCopyWith<$R, Command, $Out> {
  CommandCopyWith<$R, Command, $Out> get $asCommand =>
      $base.as((v, t, t2) => _CommandCopyWithImpl(v, t, t2));
}

abstract class CommandCopyWith<$R, $In extends Command, $Out>
    implements ScriptCopyWith<$R, $In, $Out> {
  @override
  $R call({String? command});
  CommandCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommandCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Command, $Out>
    implements CommandCopyWith<$R, Command, $Out> {
  _CommandCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Command> $mapper =
      CommandMapper.ensureInitialized();
  @override
  $R call({String? command}) =>
      $apply(FieldCopyWithData({if (command != null) #command: command}));
  @override
  Command $make(CopyWithData data) =>
      Command(command: data.get(#command, or: $value.command));

  @override
  CommandCopyWith<$R2, Command, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CommandCopyWithImpl($value, $cast, t);
}

class ActionApplyCheckStatusMapper
    extends SubClassMapperBase<ActionApplyCheckStatus> {
  ActionApplyCheckStatusMapper._();

  static ActionApplyCheckStatusMapper? _instance;
  static ActionApplyCheckStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActionApplyCheckStatusMapper._());
      ActionBuiltinScriptMapper.ensureInitialized().addSubMapper(_instance!);
      CheckStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ActionApplyCheckStatus';

  static CheckStatus _$checkStatus(ActionApplyCheckStatus v) => v.checkStatus;
  static const Field<ActionApplyCheckStatus, CheckStatus> _f$checkStatus =
      Field('checkStatus', _$checkStatus, key: 'check_status');

  @override
  final Map<Symbol, Field<ActionApplyCheckStatus, dynamic>> fields = const {
    #checkStatus: _f$checkStatus,
  };

  @override
  final String discriminatorKey = 'name';
  @override
  final dynamic discriminatorValue = 'apply_check_status';
  @override
  late final ClassMapperBase superMapper =
      ActionBuiltinScriptMapper.ensureInitialized();

  @override
  final MappingHook hook = const FieldUnwrappingHook('options');
  @override
  final MappingHook superHook =
      const ChainedHook([FieldUnwrappingHook('builtin_action'), ScriptHook()]);

  static ActionApplyCheckStatus _instantiate(DecodingData data) {
    return ActionApplyCheckStatus(checkStatus: data.dec(_f$checkStatus));
  }

  @override
  final Function instantiate = _instantiate;

  static ActionApplyCheckStatus fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ActionApplyCheckStatus>(map));
  }

  static ActionApplyCheckStatus fromJson(String json) {
    return _guard((c) => c.fromJson<ActionApplyCheckStatus>(json));
  }
}

mixin ActionApplyCheckStatusMappable {
  String toJson() {
    return ActionApplyCheckStatusMapper._guard(
        (c) => c.toJson(this as ActionApplyCheckStatus));
  }

  Map<String, dynamic> toMap() {
    return ActionApplyCheckStatusMapper._guard(
        (c) => c.toMap(this as ActionApplyCheckStatus));
  }

  ActionApplyCheckStatusCopyWith<ActionApplyCheckStatus, ActionApplyCheckStatus,
          ActionApplyCheckStatus>
      get copyWith => _ActionApplyCheckStatusCopyWithImpl(
          this as ActionApplyCheckStatus, $identity, $identity);
  @override
  String toString() {
    return ActionApplyCheckStatusMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ActionApplyCheckStatusMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ActionApplyCheckStatusMapper._guard((c) => c.hash(this));
  }
}

extension ActionApplyCheckStatusValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActionApplyCheckStatus, $Out> {
  ActionApplyCheckStatusCopyWith<$R, ActionApplyCheckStatus, $Out>
      get $asActionApplyCheckStatus =>
          $base.as((v, t, t2) => _ActionApplyCheckStatusCopyWithImpl(v, t, t2));
}

abstract class ActionApplyCheckStatusCopyWith<
    $R,
    $In extends ActionApplyCheckStatus,
    $Out> implements ActionBuiltinScriptCopyWith<$R, $In, $Out> {
  CheckStatusCopyWith<$R, CheckStatus, CheckStatus> get checkStatus;
  @override
  $R call({CheckStatus? checkStatus});
  ActionApplyCheckStatusCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActionApplyCheckStatusCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActionApplyCheckStatus, $Out>
    implements
        ActionApplyCheckStatusCopyWith<$R, ActionApplyCheckStatus, $Out> {
  _ActionApplyCheckStatusCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActionApplyCheckStatus> $mapper =
      ActionApplyCheckStatusMapper.ensureInitialized();
  @override
  CheckStatusCopyWith<$R, CheckStatus, CheckStatus> get checkStatus =>
      $value.checkStatus.copyWith.$chain((v) => call(checkStatus: v));
  @override
  $R call({CheckStatus? checkStatus}) => $apply(
      FieldCopyWithData({if (checkStatus != null) #checkStatus: checkStatus}));
  @override
  ActionApplyCheckStatus $make(CopyWithData data) => ActionApplyCheckStatus(
      checkStatus: data.get(#checkStatus, or: $value.checkStatus));

  @override
  ActionApplyCheckStatusCopyWith<$R2, ActionApplyCheckStatus, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ActionApplyCheckStatusCopyWithImpl($value, $cast, t);
}

class ActionCollectArtifactsMapper
    extends SubClassMapperBase<ActionCollectArtifacts> {
  ActionCollectArtifactsMapper._();

  static ActionCollectArtifactsMapper? _instance;
  static ActionCollectArtifactsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActionCollectArtifactsMapper._());
      ActionBuiltinScriptMapper.ensureInitialized().addSubMapper(_instance!);
      ActionCollectArtifactsFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ActionCollectArtifacts';

  static List<ActionCollectArtifactsFile> _$files(ActionCollectArtifacts v) =>
      v.files;
  static const Field<ActionCollectArtifacts, List<ActionCollectArtifactsFile>>
      _f$files = Field('files', _$files, opt: true, def: const []);

  @override
  final Map<Symbol, Field<ActionCollectArtifacts, dynamic>> fields = const {
    #files: _f$files,
  };

  @override
  final String discriminatorKey = 'name';
  @override
  final dynamic discriminatorValue = 'collect_artifacts';
  @override
  late final ClassMapperBase superMapper =
      ActionBuiltinScriptMapper.ensureInitialized();

  @override
  final MappingHook hook = const FieldUnwrappingHook('options');
  @override
  final MappingHook superHook =
      const ChainedHook([FieldUnwrappingHook('builtin_action'), ScriptHook()]);

  static ActionCollectArtifacts _instantiate(DecodingData data) {
    return ActionCollectArtifacts(files: data.dec(_f$files));
  }

  @override
  final Function instantiate = _instantiate;

  static ActionCollectArtifacts fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ActionCollectArtifacts>(map));
  }

  static ActionCollectArtifacts fromJson(String json) {
    return _guard((c) => c.fromJson<ActionCollectArtifacts>(json));
  }
}

mixin ActionCollectArtifactsMappable {
  String toJson() {
    return ActionCollectArtifactsMapper._guard(
        (c) => c.toJson(this as ActionCollectArtifacts));
  }

  Map<String, dynamic> toMap() {
    return ActionCollectArtifactsMapper._guard(
        (c) => c.toMap(this as ActionCollectArtifacts));
  }

  ActionCollectArtifactsCopyWith<ActionCollectArtifacts, ActionCollectArtifacts,
          ActionCollectArtifacts>
      get copyWith => _ActionCollectArtifactsCopyWithImpl(
          this as ActionCollectArtifacts, $identity, $identity);
  @override
  String toString() {
    return ActionCollectArtifactsMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ActionCollectArtifactsMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ActionCollectArtifactsMapper._guard((c) => c.hash(this));
  }
}

extension ActionCollectArtifactsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActionCollectArtifacts, $Out> {
  ActionCollectArtifactsCopyWith<$R, ActionCollectArtifacts, $Out>
      get $asActionCollectArtifacts =>
          $base.as((v, t, t2) => _ActionCollectArtifactsCopyWithImpl(v, t, t2));
}

abstract class ActionCollectArtifactsCopyWith<
    $R,
    $In extends ActionCollectArtifacts,
    $Out> implements ActionBuiltinScriptCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ActionCollectArtifactsFile,
      ActionCollectArtifactsFileCopyWith<$R, ActionCollectArtifactsFile,
          ActionCollectArtifactsFile>> get files;
  @override
  $R call({List<ActionCollectArtifactsFile>? files});
  ActionCollectArtifactsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActionCollectArtifactsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActionCollectArtifacts, $Out>
    implements
        ActionCollectArtifactsCopyWith<$R, ActionCollectArtifacts, $Out> {
  _ActionCollectArtifactsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActionCollectArtifacts> $mapper =
      ActionCollectArtifactsMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ActionCollectArtifactsFile,
      ActionCollectArtifactsFileCopyWith<$R, ActionCollectArtifactsFile,
          ActionCollectArtifactsFile>> get files => ListCopyWith(
      $value.files, (v, t) => v.copyWith.$chain(t), (v) => call(files: v));
  @override
  $R call({List<ActionCollectArtifactsFile>? files}) =>
      $apply(FieldCopyWithData({if (files != null) #files: files}));
  @override
  ActionCollectArtifacts $make(CopyWithData data) =>
      ActionCollectArtifacts(files: data.get(#files, or: $value.files));

  @override
  ActionCollectArtifactsCopyWith<$R2, ActionCollectArtifacts, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ActionCollectArtifactsCopyWithImpl($value, $cast, t);
}

class ActionTelegramMessageMapper
    extends SubClassMapperBase<ActionTelegramMessage> {
  ActionTelegramMessageMapper._();

  static ActionTelegramMessageMapper? _instance;
  static ActionTelegramMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActionTelegramMessageMapper._());
      ActionBuiltinScriptMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ActionTelegramMessage';

  static String _$type(ActionTelegramMessage v) => v.type;
  static const Field<ActionTelegramMessage, String> _f$type =
      Field('type', _$type);
  static String _$chatId(ActionTelegramMessage v) => v.chatId;
  static const Field<ActionTelegramMessage, String> _f$chatId =
      Field('chatId', _$chatId, key: 'chat_id');
  static String? _$message(ActionTelegramMessage v) => v.message;
  static const Field<ActionTelegramMessage, String> _f$message =
      Field('message', _$message, opt: true);
  static bool _$useReply(ActionTelegramMessage v) => v.useReply;
  static const Field<ActionTelegramMessage, bool> _f$useReply =
      Field('useReply', _$useReply, key: 'use_reply', opt: true, def: true);

  @override
  final Map<Symbol, Field<ActionTelegramMessage, dynamic>> fields = const {
    #type: _f$type,
    #chatId: _f$chatId,
    #message: _f$message,
    #useReply: _f$useReply,
  };

  @override
  final String discriminatorKey = 'name';
  @override
  final dynamic discriminatorValue = 'tg_msg';
  @override
  late final ClassMapperBase superMapper =
      ActionBuiltinScriptMapper.ensureInitialized();

  @override
  final MappingHook hook = const FieldUnwrappingHook('options');
  @override
  final MappingHook superHook =
      const ChainedHook([FieldUnwrappingHook('builtin_action'), ScriptHook()]);

  static ActionTelegramMessage _instantiate(DecodingData data) {
    return ActionTelegramMessage(
        type: data.dec(_f$type),
        chatId: data.dec(_f$chatId),
        message: data.dec(_f$message),
        useReply: data.dec(_f$useReply));
  }

  @override
  final Function instantiate = _instantiate;

  static ActionTelegramMessage fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ActionTelegramMessage>(map));
  }

  static ActionTelegramMessage fromJson(String json) {
    return _guard((c) => c.fromJson<ActionTelegramMessage>(json));
  }
}

mixin ActionTelegramMessageMappable {
  String toJson() {
    return ActionTelegramMessageMapper._guard(
        (c) => c.toJson(this as ActionTelegramMessage));
  }

  Map<String, dynamic> toMap() {
    return ActionTelegramMessageMapper._guard(
        (c) => c.toMap(this as ActionTelegramMessage));
  }

  ActionTelegramMessageCopyWith<ActionTelegramMessage, ActionTelegramMessage,
          ActionTelegramMessage>
      get copyWith => _ActionTelegramMessageCopyWithImpl(
          this as ActionTelegramMessage, $identity, $identity);
  @override
  String toString() {
    return ActionTelegramMessageMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ActionTelegramMessageMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ActionTelegramMessageMapper._guard((c) => c.hash(this));
  }
}

extension ActionTelegramMessageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActionTelegramMessage, $Out> {
  ActionTelegramMessageCopyWith<$R, ActionTelegramMessage, $Out>
      get $asActionTelegramMessage =>
          $base.as((v, t, t2) => _ActionTelegramMessageCopyWithImpl(v, t, t2));
}

abstract class ActionTelegramMessageCopyWith<
    $R,
    $In extends ActionTelegramMessage,
    $Out> implements ActionBuiltinScriptCopyWith<$R, $In, $Out> {
  @override
  $R call({String? type, String? chatId, String? message, bool? useReply});
  ActionTelegramMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActionTelegramMessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActionTelegramMessage, $Out>
    implements ActionTelegramMessageCopyWith<$R, ActionTelegramMessage, $Out> {
  _ActionTelegramMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActionTelegramMessage> $mapper =
      ActionTelegramMessageMapper.ensureInitialized();
  @override
  $R call(
          {String? type,
          String? chatId,
          Object? message = $none,
          bool? useReply}) =>
      $apply(FieldCopyWithData({
        if (type != null) #type: type,
        if (chatId != null) #chatId: chatId,
        if (message != $none) #message: message,
        if (useReply != null) #useReply: useReply
      }));
  @override
  ActionTelegramMessage $make(CopyWithData data) => ActionTelegramMessage(
      type: data.get(#type, or: $value.type),
      chatId: data.get(#chatId, or: $value.chatId),
      message: data.get(#message, or: $value.message),
      useReply: data.get(#useReply, or: $value.useReply));

  @override
  ActionTelegramMessageCopyWith<$R2, ActionTelegramMessage, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ActionTelegramMessageCopyWithImpl($value, $cast, t);
}
