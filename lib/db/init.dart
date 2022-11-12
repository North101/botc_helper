import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart' hide JsonKey;
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

import '/db/database.dart';
import '/util/assets.gen.dart';

part 'init.g.dart';

Future<dynamic> loadJson(String key) async => json.decode(await rootBundle.loadString(key));

Future<List<T>> loadJsonList<T>(String key, T Function(dynamic e) toElement) async {
  return (await loadJson(key) as List).map(toElement).toList();
}

@JsonSerializable(createToJson: false)
class ScriptJson {
  const ScriptJson(this.id, this.name, this.characters, this.firstNight, this.otherNight);

  factory ScriptJson.fromJson(Map json) => _$ScriptJsonFromJson(json);

  final String id;
  final String name;
  final List<String> characters;
  @JsonKey(name: 'first_night', defaultValue: [])
  final List<String> firstNight;
  @JsonKey(name: 'other_night', defaultValue: [])
  final List<String> otherNight;
}

@JsonSerializable(createToJson: false)
class CharacterJson {
  const CharacterJson(this.id, this.name, this.type, this.description, this.options);

  factory CharacterJson.fromJson(Map json) => _$CharacterJsonFromJson(json);

  static List<CharacterOptionJson> optionsFromJson(List json) =>
      json.map((e) => CharacterOptionJson.fromJson(e)).toList();

  final String id;
  final String name;
  final CharacterType type;
  final String description;
  final List<CharacterOptionJson> options;
}

@JsonSerializable(createToJson: false)
class CharacterOptionJson {
  const CharacterOptionJson(this.title, this.items, this.next);

  factory CharacterOptionJson.fromJson(Map json) => _$CharacterOptionJsonFromJson(json);

  final String title;
  final List<OptionItem> items;
  final CharacterOptionItem? next;
}

@JsonSerializable(createToJson: false)
class CharacterNightJson {
  const CharacterNightJson(this.firstNight, this.otherNight);

  factory CharacterNightJson.fromJson(Map json) => _$CharacterNightJsonFromJson(json);

  static List<CharacterNightReminderJson> characterNightReminder(List json) =>
      listFromJson(json, CharacterNightReminderJson.fromJson);

  @JsonKey(name: 'first_night')
  final List<CharacterNightReminderJson> firstNight;
  @JsonKey(name: 'other_night')
  final List<CharacterNightReminderJson> otherNight;
}

@JsonSerializable(createToJson: false)
class CharacterNightReminderJson {
  const CharacterNightReminderJson(this.id, this.reminderId, this.reminder);

  factory CharacterNightReminderJson.fromJson(Map json) => _$CharacterNightReminderJsonFromJson(json);

  final String id;
  @JsonKey(name: 'reminder_id')
  final String? reminderId;
  final String reminder;
}

Future<void> initCharacters(Database db) async {
  final genericOptionList = await loadJsonList(Assets.data.generic, (e) => CharacterOptionJson.fromJson(e));
  final characterList = await loadJsonList(Assets.data.character, (e) => CharacterJson.fromJson(e));
  final characterNightList = CharacterNightJson.fromJson(await loadJson(Assets.data.night));

  await db.batch((batch) {
    final officialCharacters = db.selectOnly(db.character)
      ..addColumns([db.character.id])
      ..where(db.character.custom.not());

    batch.deleteWhere(
      db.characterNight,
      (characterNight) => characterNight.characterId.isInQuery(officialCharacters),
    );
    batch.deleteWhere(
      db.characterOption,
      (characterOption) =>
          characterOption.characterId.isInQuery(officialCharacters) | characterOption.characterId.isNull(),
    );
    batch.deleteWhere(
      db.character,
      (character) => character.id.isInQuery(officialCharacters),
    );

    batch.insertAll<Character, CharacterData>(db.character, [
      for (final character in characterList.asMap().entries)
        CharacterCompanion.insert(
          id: character.value.id,
          name: character.value.name,
          position: character.key,
          type: character.value.type,
          description: character.value.description,
          custom: false,
        ),
    ]);
    batch.insertAll<CharacterOption, CharacterOptionData>(db.characterOption, [
      for (final generic in genericOptionList.asMap().entries)
        CharacterOptionCompanion.insert(
          characterId: const Value(null),
          position: generic.key,
          title: generic.value.title,
          item: CharacterOptionItem(
            generic.value.items,
            generic.value.next,
          ),
          custom: false,
        ),
    ]);
    batch.insertAll<CharacterOption, CharacterOptionData>(db.characterOption, [
      for (final character in characterList)
        for (final characterOption in character.options.asMap().entries)
          CharacterOptionCompanion.insert(
            characterId: Value(character.id),
            position: characterOption.key,
            title: characterOption.value.title,
            item: CharacterOptionItem(
              characterOption.value.items,
              characterOption.value.next,
            ),
            custom: false,
          ),
    ]);
    batch.insertAll(db.characterNight, [
      for (final characterNight in characterNightList.firstNight.asMap().entries)
        CharacterNightData(
          type: NightType.firstNight,
          position: characterNight.key,
          characterId: characterNight.value.id,
          reminderId: characterNight.value.reminderId ?? characterNight.value.id,
          reminder: characterNight.value.reminder,
        ),
      for (final characterNight in characterNightList.otherNight.asMap().entries)
        CharacterNightData(
          type: NightType.otherNight,
          position: characterNight.key,
          characterId: characterNight.value.id,
          reminderId: characterNight.value.reminderId ?? characterNight.value.id,
          reminder: characterNight.value.reminder,
        ),
    ]);
  });
}

Future<void> initScripts(Database db) async {
  final scriptList = await loadJsonList(Assets.data.script, (e) => ScriptJson.fromJson(e));
  await db.batch((batch) {
    final officialScripts = db.selectOnly(db.script)
      ..addColumns([db.script.id])
      ..where(db.script.custom.not());

    batch.deleteWhere(
      db.scriptCharacter,
      (scriptCharacter) => scriptCharacter.scriptId.isInQuery(officialScripts),
    );
    batch.deleteWhere(
      db.script,
      (script) => script.id.isInQuery(officialScripts),
    );

    batch.insertAll<Script, ScriptData>(db.script, [
      for (final script in scriptList)
        ScriptCompanion.insert(
          id: script.id,
          name: script.name,
          custom: false,
        ),
    ]);
    batch.insertAll<ScriptCharacter, ScriptCharacterData>(db.scriptCharacter, [
      for (final script in scriptList)
        for (final characterId in script.characters)
          ScriptCharacterCompanion.insert(
            scriptId: script.id,
            characterId: characterId,
          ),
    ]);
    batch.insertAll<ScriptCharacterNight, ScriptCharacterNightData>(db.scriptCharacterNight, [
      for (final script in scriptList)
        for (final characterId in script.firstNight.asMap().entries)
          ScriptCharacterNightCompanion.insert(
            scriptId: script.id,
            type: NightType.firstNight,
            position: characterId.key,
            reminderId: characterId.value,
          ),
      for (final script in scriptList)
        for (final characterId in script.otherNight.asMap().entries)
          ScriptCharacterNightCompanion.insert(
            scriptId: script.id,
            type: NightType.otherNight,
            position: characterId.key,
            reminderId: characterId.value,
          ),
    ]);
  });
}

Future<void> initDatabase(Database db) async {
  await initCharacters(db);
  await initScripts(db);
}
