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
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      custom: attachedDatabase.options.types
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
  final int? firstNight;
  final String firstNightReminder;
  final int? otherNight;
  final String otherNightReminder;
  final bool custom;
  const CharacterData(
      {required this.id,
      required this.name,
      required this.position,
      required this.type,
      required this.description,
      this.firstNight,
      required this.firstNightReminder,
      this.otherNight,
      required this.otherNightReminder,
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
    if (!nullToAbsent || firstNight != null) {
      map['first_night'] = Variable<int>(firstNight);
    }
    map['first_night_reminder'] = Variable<String>(firstNightReminder);
    if (!nullToAbsent || otherNight != null) {
      map['other_night'] = Variable<int>(otherNight);
    }
    map['other_night_reminder'] = Variable<String>(otherNightReminder);
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
      firstNight: firstNight == null && nullToAbsent
          ? const Value.absent()
          : Value(firstNight),
      firstNightReminder: Value(firstNightReminder),
      otherNight: otherNight == null && nullToAbsent
          ? const Value.absent()
          : Value(otherNight),
      otherNightReminder: Value(otherNightReminder),
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
      firstNight: serializer.fromJson<int?>(json['first_night']),
      firstNightReminder:
          serializer.fromJson<String>(json['first_night_reminder']),
      otherNight: serializer.fromJson<int?>(json['other_night']),
      otherNightReminder:
          serializer.fromJson<String>(json['other_night_reminder']),
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
      'first_night': serializer.toJson<int?>(firstNight),
      'first_night_reminder': serializer.toJson<String>(firstNightReminder),
      'other_night': serializer.toJson<int?>(otherNight),
      'other_night_reminder': serializer.toJson<String>(otherNightReminder),
      'custom': serializer.toJson<bool>(custom),
    };
  }

  CharacterData copyWith(
          {String? id,
          String? name,
          int? position,
          CharacterType? type,
          String? description,
          Value<int?> firstNight = const Value.absent(),
          String? firstNightReminder,
          Value<int?> otherNight = const Value.absent(),
          String? otherNightReminder,
          bool? custom}) =>
      CharacterData(
        id: id ?? this.id,
        name: name ?? this.name,
        position: position ?? this.position,
        type: type ?? this.type,
        description: description ?? this.description,
        firstNight: firstNight.present ? firstNight.value : this.firstNight,
        firstNightReminder: firstNightReminder ?? this.firstNightReminder,
        otherNight: otherNight.present ? otherNight.value : this.otherNight,
        otherNightReminder: otherNightReminder ?? this.otherNightReminder,
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
          ..write('firstNight: $firstNight, ')
          ..write('firstNightReminder: $firstNightReminder, ')
          ..write('otherNight: $otherNight, ')
          ..write('otherNightReminder: $otherNightReminder, ')
          ..write('custom: $custom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, position, type, description,
      firstNight, firstNightReminder, otherNight, otherNightReminder, custom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterData &&
          other.id == this.id &&
          other.name == this.name &&
          other.position == this.position &&
          other.type == this.type &&
          other.description == this.description &&
          other.firstNight == this.firstNight &&
          other.firstNightReminder == this.firstNightReminder &&
          other.otherNight == this.otherNight &&
          other.otherNightReminder == this.otherNightReminder &&
          other.custom == this.custom);
}

class CharacterCompanion extends UpdateCompanion<CharacterData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> position;
  final Value<CharacterType> type;
  final Value<String> description;
  final Value<int?> firstNight;
  final Value<String> firstNightReminder;
  final Value<int?> otherNight;
  final Value<String> otherNightReminder;
  final Value<bool> custom;
  const CharacterCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.position = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.firstNight = const Value.absent(),
    this.firstNightReminder = const Value.absent(),
    this.otherNight = const Value.absent(),
    this.otherNightReminder = const Value.absent(),
    this.custom = const Value.absent(),
  });
  CharacterCompanion.insert({
    required String id,
    required String name,
    required int position,
    required CharacterType type,
    required String description,
    this.firstNight = const Value.absent(),
    required String firstNightReminder,
    this.otherNight = const Value.absent(),
    required String otherNightReminder,
    required bool custom,
  })  : id = Value(id),
        name = Value(name),
        position = Value(position),
        type = Value(type),
        description = Value(description),
        firstNightReminder = Value(firstNightReminder),
        otherNightReminder = Value(otherNightReminder),
        custom = Value(custom);
  static Insertable<CharacterData> createCustom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? position,
    Expression<String>? type,
    Expression<String>? description,
    Expression<int>? firstNight,
    Expression<String>? firstNightReminder,
    Expression<int>? otherNight,
    Expression<String>? otherNightReminder,
    Expression<bool>? custom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (position != null) 'position': position,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (firstNight != null) 'first_night': firstNight,
      if (firstNightReminder != null)
        'first_night_reminder': firstNightReminder,
      if (otherNight != null) 'other_night': otherNight,
      if (otherNightReminder != null)
        'other_night_reminder': otherNightReminder,
      if (custom != null) 'custom': custom,
    });
  }

  CharacterCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? position,
      Value<CharacterType>? type,
      Value<String>? description,
      Value<int?>? firstNight,
      Value<String>? firstNightReminder,
      Value<int?>? otherNight,
      Value<String>? otherNightReminder,
      Value<bool>? custom}) {
    return CharacterCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
      type: type ?? this.type,
      description: description ?? this.description,
      firstNight: firstNight ?? this.firstNight,
      firstNightReminder: firstNightReminder ?? this.firstNightReminder,
      otherNight: otherNight ?? this.otherNight,
      otherNightReminder: otherNightReminder ?? this.otherNightReminder,
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
    if (firstNight.present) {
      map['first_night'] = Variable<int>(firstNight.value);
    }
    if (firstNightReminder.present) {
      map['first_night_reminder'] = Variable<String>(firstNightReminder.value);
    }
    if (otherNight.present) {
      map['other_night'] = Variable<int>(otherNight.value);
    }
    if (otherNightReminder.present) {
      map['other_night_reminder'] = Variable<String>(otherNightReminder.value);
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
          ..write('firstNight: $firstNight, ')
          ..write('firstNightReminder: $firstNightReminder, ')
          ..write('otherNight: $otherNight, ')
          ..write('otherNightReminder: $otherNightReminder, ')
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
  final VerificationMeta _firstNightMeta = const VerificationMeta('firstNight');
  late final GeneratedColumn<int> firstNight = GeneratedColumn<int>(
      'first_night', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _firstNightReminderMeta =
      const VerificationMeta('firstNightReminder');
  late final GeneratedColumn<String> firstNightReminder =
      GeneratedColumn<String>('first_night_reminder', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  final VerificationMeta _otherNightMeta = const VerificationMeta('otherNight');
  late final GeneratedColumn<int> otherNight = GeneratedColumn<int>(
      'other_night', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _otherNightReminderMeta =
      const VerificationMeta('otherNightReminder');
  late final GeneratedColumn<String> otherNightReminder =
      GeneratedColumn<String>('other_night_reminder', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [
        id,
        name,
        position,
        type,
        description,
        firstNight,
        firstNightReminder,
        otherNight,
        otherNightReminder,
        custom
      ];
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
    if (data.containsKey('first_night')) {
      context.handle(
          _firstNightMeta,
          firstNight.isAcceptableOrUnknown(
              data['first_night']!, _firstNightMeta));
    }
    if (data.containsKey('first_night_reminder')) {
      context.handle(
          _firstNightReminderMeta,
          firstNightReminder.isAcceptableOrUnknown(
              data['first_night_reminder']!, _firstNightReminderMeta));
    } else if (isInserting) {
      context.missing(_firstNightReminderMeta);
    }
    if (data.containsKey('other_night')) {
      context.handle(
          _otherNightMeta,
          otherNight.isAcceptableOrUnknown(
              data['other_night']!, _otherNightMeta));
    }
    if (data.containsKey('other_night_reminder')) {
      context.handle(
          _otherNightReminderMeta,
          otherNightReminder.isAcceptableOrUnknown(
              data['other_night_reminder']!, _otherNightReminderMeta));
    } else if (isInserting) {
      context.missing(_otherNightReminderMeta);
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
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      position: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      type: Character.$converter0.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      firstNight: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}first_night']),
      firstNightReminder: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}first_night_reminder'])!,
      otherNight: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}other_night']),
      otherNightReminder: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}other_night_reminder'])!,
      custom: attachedDatabase.options.types
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
      scriptId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}script_id'])!,
      characterId: attachedDatabase.options.types
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
      characterId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}character_id']),
      position: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      item: CharacterOption.$converter0.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}item'])!),
      custom: attachedDatabase.options.types
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

  Selectable<CharacterData> listScriptCharacter(
      {ListScriptCharacter$where? where}) {
    var $arrayStartIndex = 1;
    final generatedwhere = $write(
        where?.call(this.script, this.scriptCharacter, this.character) ??
            const CustomExpression('(TRUE)'),
        hasMultipleTables: true,
        startIndex: $arrayStartIndex);
    $arrayStartIndex += generatedwhere.amountOfVariables;
    return customSelect(
        'SELECT character.* FROM script INNER JOIN script_character ON script_character.script_id = script.id INNER JOIN character ON character.id = script_character.character_id WHERE ${generatedwhere.sql} ORDER BY script.id, character.position',
        variables: [
          ...generatedwhere.introducedVariables
        ],
        readsFrom: {
          script,
          scriptCharacter,
          character,
          ...generatedwhere.watchedTables,
        }).asyncMap(character.mapFromRow);
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
        'SELECT * FROM character WHERE ${generatedwhere.sql} ${generatedorderBy.sql}',
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

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [script, character, scriptCharacter, characterOption];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef ListScripts$where = Expression<bool> Function(Script script);
typedef ListScriptCharacter$where = Expression<bool> Function(
    Script script, ScriptCharacter script_character, Character character);
typedef ListCharacters$where = Expression<bool> Function(Character character);
typedef ListCharacters$orderBy = OrderBy Function(Character character);
typedef ListCharacterOptions$where = Expression<bool> Function(
    CharacterOption character_option);
