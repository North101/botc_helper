// GENERATED CODE, DO NOT EDIT BY HAND.
//@dart=2.12
import 'package:drift/drift.dart';

class Script extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Script(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Script createAlias(String alias) {
    return Script(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Character extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Character(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> firstNight = GeneratedColumn<int>(
      'first_night', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  late final GeneratedColumn<String> firstNightReminder =
      GeneratedColumn<String>('first_night_reminder', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  late final GeneratedColumn<int> otherNight = GeneratedColumn<int>(
      'other_night', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  late final GeneratedColumn<String> otherNightReminder =
      GeneratedColumn<String>('other_night_reminder', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Character createAlias(String alias) {
    return Character(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ScriptCharacter extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ScriptCharacter(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> scriptId = GeneratedColumn<String>(
      'script_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES script(id)');
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
  Set<GeneratedColumn> get $primaryKey => {scriptId, characterId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
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

class CharacterOption extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CharacterOption(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES character(id)');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> item = GeneratedColumn<String>(
      'item', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
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
  Set<GeneratedColumn> get $primaryKey => {characterId, position};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  CharacterOption createAlias(String alias) {
    return CharacterOption(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY (character_id, position)'];
  @override
  bool get dontWriteConstraints => true;
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  DatabaseAtV2.connect(DatabaseConnection c) : super.connect(c);
  late final Script script = Script(this);
  late final Character character = Character(this);
  late final ScriptCharacter scriptCharacter = ScriptCharacter(this);
  late final CharacterOption characterOption = CharacterOption(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [script, character, scriptCharacter, characterOption];
  @override
  int get schemaVersion => 2;
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
