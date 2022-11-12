// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ScriptData extends DataClass implements Insertable<ScriptData> {
  final String id;
  final String name;
  final bool custom;
  const ScriptData(
      {required this.id, required this.name, required this.custom});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['custom'] = Variable<bool>(custom);
    return map;
  }

  ScriptCompanion toCompanion(bool nullToAbsent) {
    return ScriptCompanion(
      id: Value(id),
      name: Value(name),
      custom: Value(custom),
    );
  }

  factory ScriptData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScriptData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      custom: serializer.fromJson<bool>(json['custom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'custom': serializer.toJson<bool>(custom),
    };
  }

  ScriptData copyWith({String? id, String? name, bool? custom}) => ScriptData(
        id: id ?? this.id,
        name: name ?? this.name,
        custom: custom ?? this.custom,
      );
  @override
  String toString() {
    return (StringBuffer('ScriptData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('custom: $custom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, custom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScriptData &&
          other.id == this.id &&
          other.name == this.name &&
          other.custom == this.custom);
}

class ScriptCompanion extends UpdateCompanion<ScriptData> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> custom;
  const ScriptCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.custom = const Value.absent(),
  });
  ScriptCompanion.insert({
    required String id,
    required String name,
    required bool custom,
  })  : id = Value(id),
        name = Value(name),
        custom = Value(custom);
  static Insertable<ScriptData> createCustom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? custom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (custom != null) 'custom': custom,
    });
  }

  ScriptCompanion copyWith(
      {Value<String>? id, Value<String>? name, Value<bool>? custom}) {
    return ScriptCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      custom: custom ?? this.custom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (custom.present) {
      map['custom'] = Variable<bool>(custom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScriptCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('custom: $custom')
          ..write(')'))
        .toString();
  }
}

class Script extends Table with TableInfo<Script, ScriptData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Script(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _customMeta = const VerificationMeta('custom');
  late final GeneratedColumn<bool> custom = GeneratedColumn<bool>(
      'custom', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, custom];
  @override
  String get aliasedName => _alias ?? 'script';
  @override
  String get actualTableName => 'script';
  @override
  VerificationContext validateIntegrity(Insertable<ScriptData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('custom')) {
      context.handle(_customMeta,
          custom.isAcceptableOrUnknown(data['custom']!, _customMeta));
    } else if (isInserting) {
      context.missing(_customMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScriptData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScriptData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      custom: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}custom'])!,
    );
  }

  @override
  Script createAlias(String alias) {
    return Script(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CharacterData extends DataClass implements Insertable<CharacterData> {
  final String id;
  final String name;
  final int position;
  final CharacterType type;
  final String description;
  final bool custom;
  const CharacterData(
      {required this.id,
      required this.name,
      required this.position,
      required this.type,
      required this.description,
      required this.custom});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['position'] = Variable<int>(position);
    {
      final converter = Character.$converter0;
      map['type'] = Variable<String>(converter.toSql(type));
    }
    map['description'] = Variable<String>(description);
    map['custom'] = Variable<bool>(custom);
    return map;
  }

  CharacterCompanion toCompanion(bool nullToAbsent) {
    return CharacterCompanion(
      id: Value(id),
      name: Value(name),
      position: Value(position),
      type: Value(type),
      description: Value(description),
      custom: Value(custom),
    );
  }

  factory CharacterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      position: serializer.fromJson<int>(json['position']),
      type: Character.$converter0
          .fromJson(serializer.fromJson<String>(json['type'])),
      description: serializer.fromJson<String>(json['description']),
      custom: serializer.fromJson<bool>(json['custom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'position': serializer.toJson<int>(position),
      'type': serializer.toJson<String>(Character.$converter0.toJson(type)),
      'description': serializer.toJson<String>(description),
      'custom': serializer.toJson<bool>(custom),
    };
  }

  CharacterData copyWith(
          {String? id,
          String? name,
          int? position,
          CharacterType? type,
          String? description,
          bool? custom}) =>
      CharacterData(
        id: id ?? this.id,
        name: name ?? this.name,
        position: position ?? this.position,
        type: type ?? this.type,
        description: description ?? this.description,
        custom: custom ?? this.custom,
      );
  @override
  String toString() {
    return (StringBuffer('CharacterData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('position: $position, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('custom: $custom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, position, type, description, custom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterData &&
          other.id == this.id &&
          other.name == this.name &&
          other.position == this.position &&
          other.type == this.type &&
          other.description == this.description &&
          other.custom == this.custom);
}

class CharacterCompanion extends UpdateCompanion<CharacterData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> position;
  final Value<CharacterType> type;
  final Value<String> description;
  final Value<bool> custom;
  const CharacterCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.position = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.custom = const Value.absent(),
  });
  CharacterCompanion.insert({
    required String id,
    required String name,
    required int position,
    required CharacterType type,
    required String description,
    required bool custom,
  })  : id = Value(id),
        name = Value(name),
        position = Value(position),
        type = Value(type),
        description = Value(description),
        custom = Value(custom);
  static Insertable<CharacterData> createCustom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? position,
    Expression<String>? type,
    Expression<String>? description,
    Expression<bool>? custom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (position != null) 'position': position,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (custom != null) 'custom': custom,
    });
  }

  CharacterCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? position,
      Value<CharacterType>? type,
      Value<String>? description,
      Value<bool>? custom}) {
    return CharacterCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
      type: type ?? this.type,
      description: description ?? this.description,
      custom: custom ?? this.custom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (type.present) {
      final converter = Character.$converter0;
      map['type'] = Variable<String>(converter.toSql(type.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (custom.present) {
      map['custom'] = Variable<bool>(custom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('position: $position, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('custom: $custom')
          ..write(')'))
        .toString();
  }
}

class Character extends Table with TableInfo<Character, CharacterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Character(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumnWithTypeConverter<CharacterType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<CharacterType>(Character.$converter0);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _customMeta = const VerificationMeta('custom');
  late final GeneratedColumn<bool> custom = GeneratedColumn<bool>(
      'custom', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, position, type, description, custom];
  @override
  String get aliasedName => _alias ?? 'character';
  @override
  String get actualTableName => 'character';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('custom')) {
      context.handle(_customMeta,
          custom.isAcceptableOrUnknown(data['custom']!, _customMeta));
    } else if (isInserting) {
      context.missing(_customMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      type: Character.$converter0.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      custom: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}custom'])!,
    );
  }

  @override
  Character createAlias(String alias) {
    return Character(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CharacterType, String, String> $converter0 =
      const CharacterTypeConverter();
  @override
  bool get dontWriteConstraints => true;
}

class ScriptCharacterData extends DataClass
    implements Insertable<ScriptCharacterData> {
  final String scriptId;
  final String characterId;
  const ScriptCharacterData(
      {required this.scriptId, required this.characterId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['script_id'] = Variable<String>(scriptId);
    map['character_id'] = Variable<String>(characterId);
    return map;
  }

  ScriptCharacterCompanion toCompanion(bool nullToAbsent) {
    return ScriptCharacterCompanion(
      scriptId: Value(scriptId),
      characterId: Value(characterId),
    );
  }

  factory ScriptCharacterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScriptCharacterData(
      scriptId: serializer.fromJson<String>(json['script_id']),
      characterId: serializer.fromJson<String>(json['character_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'script_id': serializer.toJson<String>(scriptId),
      'character_id': serializer.toJson<String>(characterId),
    };
  }

  ScriptCharacterData copyWith({String? scriptId, String? characterId}) =>
      ScriptCharacterData(
        scriptId: scriptId ?? this.scriptId,
        characterId: characterId ?? this.characterId,
      );
  @override
  String toString() {
    return (StringBuffer('ScriptCharacterData(')
          ..write('scriptId: $scriptId, ')
          ..write('characterId: $characterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(scriptId, characterId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScriptCharacterData &&
          other.scriptId == this.scriptId &&
          other.characterId == this.characterId);
}

class ScriptCharacterCompanion extends UpdateCompanion<ScriptCharacterData> {
  final Value<String> scriptId;
  final Value<String> characterId;
  const ScriptCharacterCompanion({
    this.scriptId = const Value.absent(),
    this.characterId = const Value.absent(),
  });
  ScriptCharacterCompanion.insert({
    required String scriptId,
    required String characterId,
  })  : scriptId = Value(scriptId),
        characterId = Value(characterId);
  static Insertable<ScriptCharacterData> custom({
    Expression<String>? scriptId,
    Expression<String>? characterId,
  }) {
    return RawValuesInsertable({
      if (scriptId != null) 'script_id': scriptId,
      if (characterId != null) 'character_id': characterId,
    });
  }

  ScriptCharacterCompanion copyWith(
      {Value<String>? scriptId, Value<String>? characterId}) {
    return ScriptCharacterCompanion(
      scriptId: scriptId ?? this.scriptId,
      characterId: characterId ?? this.characterId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (scriptId.present) {
      map['script_id'] = Variable<String>(scriptId.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScriptCharacterCompanion(')
          ..write('scriptId: $scriptId, ')
          ..write('characterId: $characterId')
          ..write(')'))
        .toString();
  }
}

class ScriptCharacter extends Table
    with TableInfo<ScriptCharacter, ScriptCharacterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ScriptCharacter(this.attachedDatabase, [this._alias]);
  final VerificationMeta _scriptIdMeta = const VerificationMeta('scriptId');
  late final GeneratedColumn<String> scriptId = GeneratedColumn<String>(
      'script_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES script(id)');
  final VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES character(id)');
  @override
  List<GeneratedColumn> get $columns => [scriptId, characterId];
  @override
  String get aliasedName => _alias ?? 'script_character';
  @override
  String get actualTableName => 'script_character';
  @override
  VerificationContext validateIntegrity(
      Insertable<ScriptCharacterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('script_id')) {
      context.handle(_scriptIdMeta,
          scriptId.isAcceptableOrUnknown(data['script_id']!, _scriptIdMeta));
    } else if (isInserting) {
      context.missing(_scriptIdMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {scriptId, characterId};
  @override
  ScriptCharacterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScriptCharacterData(
      scriptId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}script_id'])!,
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_id'])!,
    );
  }

  @override
  ScriptCharacter createAlias(String alias) {
    return ScriptCharacter(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY (script_id, character_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class CharacterNightData extends DataClass
    implements Insertable<CharacterNightData> {
  final NightType type;
  final int position;
  final String characterId;
  final String reminderId;
  final String reminder;
  const CharacterNightData(
      {required this.type,
      required this.position,
      required this.characterId,
      required this.reminderId,
      required this.reminder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      final converter = CharacterNight.$converter0;
      map['type'] = Variable<String>(converter.toSql(type));
    }
    map['position'] = Variable<int>(position);
    map['character_id'] = Variable<String>(characterId);
    map['reminder_id'] = Variable<String>(reminderId);
    map['reminder'] = Variable<String>(reminder);
    return map;
  }

  CharacterNightCompanion toCompanion(bool nullToAbsent) {
    return CharacterNightCompanion(
      type: Value(type),
      position: Value(position),
      characterId: Value(characterId),
      reminderId: Value(reminderId),
      reminder: Value(reminder),
    );
  }

  factory CharacterNightData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterNightData(
      type: CharacterNight.$converter0
          .fromJson(serializer.fromJson<String>(json['type'])),
      position: serializer.fromJson<int>(json['position']),
      characterId: serializer.fromJson<String>(json['character_id']),
      reminderId: serializer.fromJson<String>(json['reminder_id']),
      reminder: serializer.fromJson<String>(json['reminder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type':
          serializer.toJson<String>(CharacterNight.$converter0.toJson(type)),
      'position': serializer.toJson<int>(position),
      'character_id': serializer.toJson<String>(characterId),
      'reminder_id': serializer.toJson<String>(reminderId),
      'reminder': serializer.toJson<String>(reminder),
    };
  }

  CharacterNightData copyWith(
          {NightType? type,
          int? position,
          String? characterId,
          String? reminderId,
          String? reminder}) =>
      CharacterNightData(
        type: type ?? this.type,
        position: position ?? this.position,
        characterId: characterId ?? this.characterId,
        reminderId: reminderId ?? this.reminderId,
        reminder: reminder ?? this.reminder,
      );
  @override
  String toString() {
    return (StringBuffer('CharacterNightData(')
          ..write('type: $type, ')
          ..write('position: $position, ')
          ..write('characterId: $characterId, ')
          ..write('reminderId: $reminderId, ')
          ..write('reminder: $reminder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(type, position, characterId, reminderId, reminder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterNightData &&
          other.type == this.type &&
          other.position == this.position &&
          other.characterId == this.characterId &&
          other.reminderId == this.reminderId &&
          other.reminder == this.reminder);
}

class CharacterNightCompanion extends UpdateCompanion<CharacterNightData> {
  final Value<NightType> type;
  final Value<int> position;
  final Value<String> characterId;
  final Value<String> reminderId;
  final Value<String> reminder;
  const CharacterNightCompanion({
    this.type = const Value.absent(),
    this.position = const Value.absent(),
    this.characterId = const Value.absent(),
    this.reminderId = const Value.absent(),
    this.reminder = const Value.absent(),
  });
  CharacterNightCompanion.insert({
    required NightType type,
    required int position,
    required String characterId,
    required String reminderId,
    required String reminder,
  })  : type = Value(type),
        position = Value(position),
        characterId = Value(characterId),
        reminderId = Value(reminderId),
        reminder = Value(reminder);
  static Insertable<CharacterNightData> custom({
    Expression<String>? type,
    Expression<int>? position,
    Expression<String>? characterId,
    Expression<String>? reminderId,
    Expression<String>? reminder,
  }) {
    return RawValuesInsertable({
      if (type != null) 'type': type,
      if (position != null) 'position': position,
      if (characterId != null) 'character_id': characterId,
      if (reminderId != null) 'reminder_id': reminderId,
      if (reminder != null) 'reminder': reminder,
    });
  }

  CharacterNightCompanion copyWith(
      {Value<NightType>? type,
      Value<int>? position,
      Value<String>? characterId,
      Value<String>? reminderId,
      Value<String>? reminder}) {
    return CharacterNightCompanion(
      type: type ?? this.type,
      position: position ?? this.position,
      characterId: characterId ?? this.characterId,
      reminderId: reminderId ?? this.reminderId,
      reminder: reminder ?? this.reminder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (type.present) {
      final converter = CharacterNight.$converter0;
      map['type'] = Variable<String>(converter.toSql(type.value));
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (reminderId.present) {
      map['reminder_id'] = Variable<String>(reminderId.value);
    }
    if (reminder.present) {
      map['reminder'] = Variable<String>(reminder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterNightCompanion(')
          ..write('type: $type, ')
          ..write('position: $position, ')
          ..write('characterId: $characterId, ')
          ..write('reminderId: $reminderId, ')
          ..write('reminder: $reminder')
          ..write(')'))
        .toString();
  }
}

class CharacterNight extends Table
    with TableInfo<CharacterNight, CharacterNightData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CharacterNight(this.attachedDatabase, [this._alias]);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumnWithTypeConverter<NightType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<NightType>(CharacterNight.$converter0);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES character(id)');
  final VerificationMeta _reminderIdMeta = const VerificationMeta('reminderId');
  late final GeneratedColumn<String> reminderId = GeneratedColumn<String>(
      'reminder_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _reminderMeta = const VerificationMeta('reminder');
  late final GeneratedColumn<String> reminder = GeneratedColumn<String>(
      'reminder', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [type, position, characterId, reminderId, reminder];
  @override
  String get aliasedName => _alias ?? 'character_night';
  @override
  String get actualTableName => 'character_night';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterNightData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('reminder_id')) {
      context.handle(
          _reminderIdMeta,
          reminderId.isAcceptableOrUnknown(
              data['reminder_id']!, _reminderIdMeta));
    } else if (isInserting) {
      context.missing(_reminderIdMeta);
    }
    if (data.containsKey('reminder')) {
      context.handle(_reminderMeta,
          reminder.isAcceptableOrUnknown(data['reminder']!, _reminderMeta));
    } else if (isInserting) {
      context.missing(_reminderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {type, position};
  @override
  CharacterNightData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterNightData(
      type: CharacterNight.$converter0.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_id'])!,
      reminderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reminder_id'])!,
      reminder: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reminder'])!,
    );
  }

  @override
  CharacterNight createAlias(String alias) {
    return CharacterNight(attachedDatabase, alias);
  }

  static JsonTypeConverter2<NightType, String, String> $converter0 =
      const NightTypeConverter();
  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY (type, position)', 'UNIQUE (type, reminder_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class ScriptCharacterNightData extends DataClass
    implements Insertable<ScriptCharacterNightData> {
  final String scriptId;
  final NightType type;
  final int position;
  final String reminderId;
  const ScriptCharacterNightData(
      {required this.scriptId,
      required this.type,
      required this.position,
      required this.reminderId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['script_id'] = Variable<String>(scriptId);
    {
      final converter = ScriptCharacterNight.$converter0;
      map['type'] = Variable<String>(converter.toSql(type));
    }
    map['position'] = Variable<int>(position);
    map['reminder_id'] = Variable<String>(reminderId);
    return map;
  }

  ScriptCharacterNightCompanion toCompanion(bool nullToAbsent) {
    return ScriptCharacterNightCompanion(
      scriptId: Value(scriptId),
      type: Value(type),
      position: Value(position),
      reminderId: Value(reminderId),
    );
  }

  factory ScriptCharacterNightData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScriptCharacterNightData(
      scriptId: serializer.fromJson<String>(json['script_id']),
      type: ScriptCharacterNight.$converter0
          .fromJson(serializer.fromJson<String>(json['type'])),
      position: serializer.fromJson<int>(json['position']),
      reminderId: serializer.fromJson<String>(json['reminder_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'script_id': serializer.toJson<String>(scriptId),
      'type': serializer
          .toJson<String>(ScriptCharacterNight.$converter0.toJson(type)),
      'position': serializer.toJson<int>(position),
      'reminder_id': serializer.toJson<String>(reminderId),
    };
  }

  ScriptCharacterNightData copyWith(
          {String? scriptId,
          NightType? type,
          int? position,
          String? reminderId}) =>
      ScriptCharacterNightData(
        scriptId: scriptId ?? this.scriptId,
        type: type ?? this.type,
        position: position ?? this.position,
        reminderId: reminderId ?? this.reminderId,
      );
  @override
  String toString() {
    return (StringBuffer('ScriptCharacterNightData(')
          ..write('scriptId: $scriptId, ')
          ..write('type: $type, ')
          ..write('position: $position, ')
          ..write('reminderId: $reminderId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(scriptId, type, position, reminderId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScriptCharacterNightData &&
          other.scriptId == this.scriptId &&
          other.type == this.type &&
          other.position == this.position &&
          other.reminderId == this.reminderId);
}

class ScriptCharacterNightCompanion
    extends UpdateCompanion<ScriptCharacterNightData> {
  final Value<String> scriptId;
  final Value<NightType> type;
  final Value<int> position;
  final Value<String> reminderId;
  const ScriptCharacterNightCompanion({
    this.scriptId = const Value.absent(),
    this.type = const Value.absent(),
    this.position = const Value.absent(),
    this.reminderId = const Value.absent(),
  });
  ScriptCharacterNightCompanion.insert({
    required String scriptId,
    required NightType type,
    required int position,
    required String reminderId,
  })  : scriptId = Value(scriptId),
        type = Value(type),
        position = Value(position),
        reminderId = Value(reminderId);
  static Insertable<ScriptCharacterNightData> custom({
    Expression<String>? scriptId,
    Expression<String>? type,
    Expression<int>? position,
    Expression<String>? reminderId,
  }) {
    return RawValuesInsertable({
      if (scriptId != null) 'script_id': scriptId,
      if (type != null) 'type': type,
      if (position != null) 'position': position,
      if (reminderId != null) 'reminder_id': reminderId,
    });
  }

  ScriptCharacterNightCompanion copyWith(
      {Value<String>? scriptId,
      Value<NightType>? type,
      Value<int>? position,
      Value<String>? reminderId}) {
    return ScriptCharacterNightCompanion(
      scriptId: scriptId ?? this.scriptId,
      type: type ?? this.type,
      position: position ?? this.position,
      reminderId: reminderId ?? this.reminderId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (scriptId.present) {
      map['script_id'] = Variable<String>(scriptId.value);
    }
    if (type.present) {
      final converter = ScriptCharacterNight.$converter0;
      map['type'] = Variable<String>(converter.toSql(type.value));
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (reminderId.present) {
      map['reminder_id'] = Variable<String>(reminderId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScriptCharacterNightCompanion(')
          ..write('scriptId: $scriptId, ')
          ..write('type: $type, ')
          ..write('position: $position, ')
          ..write('reminderId: $reminderId')
          ..write(')'))
        .toString();
  }
}

class ScriptCharacterNight extends Table
    with TableInfo<ScriptCharacterNight, ScriptCharacterNightData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ScriptCharacterNight(this.attachedDatabase, [this._alias]);
  final VerificationMeta _scriptIdMeta = const VerificationMeta('scriptId');
  late final GeneratedColumn<String> scriptId = GeneratedColumn<String>(
      'script_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES script(id)');
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumnWithTypeConverter<NightType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<NightType>(ScriptCharacterNight.$converter0);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _reminderIdMeta = const VerificationMeta('reminderId');
  late final GeneratedColumn<String> reminderId = GeneratedColumn<String>(
      'reminder_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES character_night(reminder_id)');
  @override
  List<GeneratedColumn> get $columns => [scriptId, type, position, reminderId];
  @override
  String get aliasedName => _alias ?? 'script_character_night';
  @override
  String get actualTableName => 'script_character_night';
  @override
  VerificationContext validateIntegrity(
      Insertable<ScriptCharacterNightData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('script_id')) {
      context.handle(_scriptIdMeta,
          scriptId.isAcceptableOrUnknown(data['script_id']!, _scriptIdMeta));
    } else if (isInserting) {
      context.missing(_scriptIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('reminder_id')) {
      context.handle(
          _reminderIdMeta,
          reminderId.isAcceptableOrUnknown(
              data['reminder_id']!, _reminderIdMeta));
    } else if (isInserting) {
      context.missing(_reminderIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {scriptId, type, position};
  @override
  ScriptCharacterNightData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScriptCharacterNightData(
      scriptId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}script_id'])!,
      type: ScriptCharacterNight.$converter0.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      reminderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reminder_id'])!,
    );
  }

  @override
  ScriptCharacterNight createAlias(String alias) {
    return ScriptCharacterNight(attachedDatabase, alias);
  }

  static JsonTypeConverter2<NightType, String, String> $converter0 =
      const NightTypeConverter();
  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (script_id, type, position)',
        'UNIQUE (script_id, type, reminder_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class CharacterOptionData extends DataClass
    implements Insertable<CharacterOptionData> {
  final String? characterId;
  final int position;
  final String title;
  final CharacterOptionItem item;
  final bool custom;
  const CharacterOptionData(
      {this.characterId,
      required this.position,
      required this.title,
      required this.item,
      required this.custom});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || characterId != null) {
      map['character_id'] = Variable<String>(characterId);
    }
    map['position'] = Variable<int>(position);
    map['title'] = Variable<String>(title);
    {
      final converter = CharacterOption.$converter0;
      map['item'] = Variable<String>(converter.toSql(item));
    }
    map['custom'] = Variable<bool>(custom);
    return map;
  }

  CharacterOptionCompanion toCompanion(bool nullToAbsent) {
    return CharacterOptionCompanion(
      characterId: characterId == null && nullToAbsent
          ? const Value.absent()
          : Value(characterId),
      position: Value(position),
      title: Value(title),
      item: Value(item),
      custom: Value(custom),
    );
  }

  factory CharacterOptionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterOptionData(
      characterId: serializer.fromJson<String?>(json['character_id']),
      position: serializer.fromJson<int>(json['position']),
      title: serializer.fromJson<String>(json['title']),
      item: CharacterOption.$converter0
          .fromJson(serializer.fromJson<Map<String, dynamic>>(json['item'])),
      custom: serializer.fromJson<bool>(json['custom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'character_id': serializer.toJson<String?>(characterId),
      'position': serializer.toJson<int>(position),
      'title': serializer.toJson<String>(title),
      'item': serializer.toJson<Map<String, dynamic>>(
          CharacterOption.$converter0.toJson(item)),
      'custom': serializer.toJson<bool>(custom),
    };
  }

  CharacterOptionData copyWith(
          {Value<String?> characterId = const Value.absent(),
          int? position,
          String? title,
          CharacterOptionItem? item,
          bool? custom}) =>
      CharacterOptionData(
        characterId: characterId.present ? characterId.value : this.characterId,
        position: position ?? this.position,
        title: title ?? this.title,
        item: item ?? this.item,
        custom: custom ?? this.custom,
      );
  @override
  String toString() {
    return (StringBuffer('CharacterOptionData(')
          ..write('characterId: $characterId, ')
          ..write('position: $position, ')
          ..write('title: $title, ')
          ..write('item: $item, ')
          ..write('custom: $custom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, position, title, item, custom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterOptionData &&
          other.characterId == this.characterId &&
          other.position == this.position &&
          other.title == this.title &&
          other.item == this.item &&
          other.custom == this.custom);
}

class CharacterOptionCompanion extends UpdateCompanion<CharacterOptionData> {
  final Value<String?> characterId;
  final Value<int> position;
  final Value<String> title;
  final Value<CharacterOptionItem> item;
  final Value<bool> custom;
  const CharacterOptionCompanion({
    this.characterId = const Value.absent(),
    this.position = const Value.absent(),
    this.title = const Value.absent(),
    this.item = const Value.absent(),
    this.custom = const Value.absent(),
  });
  CharacterOptionCompanion.insert({
    this.characterId = const Value.absent(),
    required int position,
    required String title,
    required CharacterOptionItem item,
    required bool custom,
  })  : position = Value(position),
        title = Value(title),
        item = Value(item),
        custom = Value(custom);
  static Insertable<CharacterOptionData> createCustom({
    Expression<String>? characterId,
    Expression<int>? position,
    Expression<String>? title,
    Expression<String>? item,
    Expression<bool>? custom,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (position != null) 'position': position,
      if (title != null) 'title': title,
      if (item != null) 'item': item,
      if (custom != null) 'custom': custom,
    });
  }

  CharacterOptionCompanion copyWith(
      {Value<String?>? characterId,
      Value<int>? position,
      Value<String>? title,
      Value<CharacterOptionItem>? item,
      Value<bool>? custom}) {
    return CharacterOptionCompanion(
      characterId: characterId ?? this.characterId,
      position: position ?? this.position,
      title: title ?? this.title,
      item: item ?? this.item,
      custom: custom ?? this.custom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (item.present) {
      final converter = CharacterOption.$converter0;
      map['item'] = Variable<String>(converter.toSql(item.value));
    }
    if (custom.present) {
      map['custom'] = Variable<bool>(custom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterOptionCompanion(')
          ..write('characterId: $characterId, ')
          ..write('position: $position, ')
          ..write('title: $title, ')
          ..write('item: $item, ')
          ..write('custom: $custom')
          ..write(')'))
        .toString();
  }
}

class CharacterOption extends Table
    with TableInfo<CharacterOption, CharacterOptionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CharacterOption(this.attachedDatabase, [this._alias]);
  final VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES character(id)');
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _itemMeta = const VerificationMeta('item');
  late final GeneratedColumnWithTypeConverter<CharacterOptionItem, String>
      item = GeneratedColumn<String>('item', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<CharacterOptionItem>(CharacterOption.$converter0);
  final VerificationMeta _customMeta = const VerificationMeta('custom');
  late final GeneratedColumn<bool> custom = GeneratedColumn<bool>(
      'custom', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [characterId, position, title, item, custom];
  @override
  String get aliasedName => _alias ?? 'character_option';
  @override
  String get actualTableName => 'character_option';
  @override
  VerificationContext validateIntegrity(
      Insertable<CharacterOptionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_id']!, _characterIdMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_itemMeta, const VerificationResult.success());
    if (data.containsKey('custom')) {
      context.handle(_customMeta,
          custom.isAcceptableOrUnknown(data['custom']!, _customMeta));
    } else if (isInserting) {
      context.missing(_customMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, position};
  @override
  CharacterOptionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterOptionData(
      characterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_id']),
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      item: CharacterOption.$converter0.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item'])!),
      custom: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}custom'])!,
    );
  }

  @override
  CharacterOption createAlias(String alias) {
    return CharacterOption(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CharacterOptionItem, String, Map<String, dynamic>>
      $converter0 = const CharacterOptionItemConverter();
  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY (character_id, position)'];
  @override
  bool get dontWriteConstraints => true;
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  _$Database.connect(DatabaseConnection c) : super.connect(c);
  late final Script script = Script(this);
  late final Character character = Character(this);
  late final ScriptCharacter scriptCharacter = ScriptCharacter(this);
  late final CharacterNight characterNight = CharacterNight(this);
  late final ScriptCharacterNight scriptCharacterNight =
      ScriptCharacterNight(this);
  late final CharacterOption characterOption = CharacterOption(this);
  Selectable<ScriptData> listScripts({ListScripts$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.script) ?? const CustomExpression('(TRUE)'),
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect('SELECT * FROM script WHERE ${generatedwhere.sql}',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          script,
          ...generatedwhere.watchedTables,
        }).asyncMap(script.mapFromRow);
  }

  Selectable<CharacterData> listCharacters(
      {ListCharacters$where? where, ListCharacters$orderBy? orderBy}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.character) ?? const CustomExpression('(TRUE)'),
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    final generatedorderBy = $write(
        orderBy?.call(this.character) ?? const OrderBy.nothing(),
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedorderBy.amountOfVariables;
    return customSelect(
        'SELECT character.* FROM character WHERE ${generatedwhere.sql} ${generatedorderBy.sql}',
        variables: [
          ...generatedwhere.introducedVariables,
          ...generatedorderBy.introducedVariables
        ],
        readsFrom: {
          character,
          ...generatedwhere.watchedTables,
          ...generatedorderBy.watchedTables,
        }).asyncMap(character.mapFromRow);
  }

  Selectable<CharacterOptionData> listCharacterOptions(
      {ListCharacterOptions$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.characterOption) ?? const CustomExpression('(TRUE)'),
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT * FROM character_option WHERE ${generatedwhere.sql} ORDER BY character_option.character_id, character_option.position',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          characterOption,
          ...generatedwhere.watchedTables,
        }).asyncMap(characterOption.mapFromRow);
  }

  Selectable<ListCharacterWithNightResult> listCharacterWithNight(
      {required NightType nightType,
      String? scriptId,
      ListCharacterWithNight$where? where,
      ListCharacterWithNight$orderBy? orderBy}) {
    var $arrayStartIndex = 3;
    final generatedwhere = $write(
        where?.call(this.character, this.characterNight,
                this.scriptCharacterNight) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    final generatedorderBy = $write(
        orderBy?.call(this.character, this.characterNight,
                this.scriptCharacterNight) ??
            const OrderBy.nothing(),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedorderBy.amountOfVariables;
    return customSelect(
        'SELECT"character"."id" AS "nested_0.id", "character"."name" AS "nested_0.name", "character"."position" AS "nested_0.position", "character"."type" AS "nested_0.type", "character"."description" AS "nested_0.description", "character"."custom" AS "nested_0.custom","character_night"."type" AS "nested_1.type", "character_night"."position" AS "nested_1.position", "character_night"."character_id" AS "nested_1.character_id", "character_night"."reminder_id" AS "nested_1.reminder_id", "character_night"."reminder" AS "nested_1.reminder","script_character_night"."script_id" AS "nested_2.script_id", "script_character_night"."type" AS "nested_2.type", "script_character_night"."position" AS "nested_2.position", "script_character_night"."reminder_id" AS "nested_2.reminder_id" FROM character INNER JOIN character_night ON character_night.character_id = character.id AND character_night.type = ?1 LEFT JOIN script_character_night ON script_character_night.script_id = ?2 AND script_character_night.reminder_id = character_night.reminder_id AND script_character_night.type = character_night.type WHERE ${generatedwhere.sql} ${generatedorderBy.sql}',
        variables: [
          Variable<String>(CharacterNight.$converter0.toSql(nightType)),
          Variable<String>(scriptId),
          ...generatedwhere.introducedVariables,
          ...generatedorderBy.introducedVariables
        ],
        readsFrom: {
          character,
          characterNight,
          scriptCharacterNight,
          ...generatedwhere.watchedTables,
          ...generatedorderBy.watchedTables,
        }).asyncMap((QueryRow row) async {
      return ListCharacterWithNightResult(
        character: await character.mapFromRow(row, tablePrefix: 'nested_0'),
        characterNight:
            await characterNight.mapFromRow(row, tablePrefix: 'nested_1'),
        scriptCharacterNight: await scriptCharacterNight.mapFromRowOrNull(row,
            tablePrefix: 'nested_2'),
      );
    });
  }

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        script,
        character,
        scriptCharacter,
        characterNight,
        scriptCharacterNight,
        characterOption
      ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef ListScripts$where = Expression<bool> Function(Script script);
typedef ListCharacters$where = Expression<bool> Function(Character character);
typedef ListCharacters$orderBy = OrderBy Function(Character character);
typedef ListCharacterOptions$where = Expression<bool> Function(
    CharacterOption character_option);

class ListCharacterWithNightResult {
  final CharacterData character;
  final CharacterNightData characterNight;
  final ScriptCharacterNightData? scriptCharacterNight;
  ListCharacterWithNightResult({
    required this.character,
    required this.characterNight,
    this.scriptCharacterNight,
  });
  @override
  int get hashCode =>
      Object.hash(character, characterNight, scriptCharacterNight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListCharacterWithNightResult &&
          other.character == this.character &&
          other.characterNight == this.characterNight &&
          other.scriptCharacterNight == this.scriptCharacterNight);
  @override
  String toString() {
    return (StringBuffer('ListCharacterWithNightResult(')
          ..write('character: $character, ')
          ..write('characterNight: $characterNight, ')
          ..write('scriptCharacterNight: $scriptCharacterNight')
          ..write(')'))
        .toString();
  }
}

typedef ListCharacterWithNight$where = Expression<bool> Function(
    Character character,
    CharacterNight character_night,
    ScriptCharacterNight script_character_night);
typedef ListCharacterWithNight$orderBy = OrderBy Function(
    Character character,
    CharacterNight character_night,
    ScriptCharacterNight script_character_night);
