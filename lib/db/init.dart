import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '/db/database.dart';
import '/util/assets.gen.dart';

Future<dynamic> loadData(String key) async {
  return json.decode(await rootBundle.loadString(key));
}

Future<void> initCharacters(Database db) async {
  final List genericData = await loadData(Assets.data.generic) as List;
  final List characterData = await loadData(Assets.data.character) as List;
  await db.batch((batch) {
    batch.deleteAll(db.character);
    batch.insertAll<Character, CharacterData>(db.character, [
      for (final character in characterData.asMap().entries)
        CharacterCompanion.insert(
          id: character.value['id'],
          name: character.value['name'],
          position: character.key,
          type: const CharacterTypeConverter().fromSql(character.value['type']),
          description: character.value['description'],
          firstNight: Value(character.value['first_night']),
          firstNightReminder: character.value['first_night_reminder'],
          otherNight: Value(character.value['other_night']),
          otherNightReminder: character.value['other_night_reminder'],
          custom: false,
        ),
    ]);
    batch.deleteAll(db.characterOption);
    batch.insertAll<CharacterOption, CharacterOptionData>(db.characterOption, [
      for (final generic in genericData.asMap().entries)
        CharacterOptionCompanion.insert(
          characterId: const Value(null),
          position: generic.key,
          title: generic.value['title'],
          item: CharacterOptionItem.fromJson((generic.value as Map).cast()),
          custom: false,
        ),
    ]);
    batch.insertAll<CharacterOption, CharacterOptionData>(db.characterOption, [
      for (final character in characterData)
        for (final characterOption in (character['options'] as List).asMap().entries)
          CharacterOptionCompanion.insert(
            characterId: Value(character['id']),
            position: characterOption.key,
            title: characterOption.value['title'],
            item: CharacterOptionItem.fromJson((characterOption.value as Map).cast()),
            custom: false,
          ),
    ]);
  });
}

Future<void> initScripts(Database db) async {
  final List data = await loadData(Assets.data.script) as List;
  await db.batch((batch) {
    batch.deleteAll(db.script);
    batch.insertAll<Script, ScriptData>(db.script, [
      for (final script in data)
        ScriptCompanion.insert(
          id: script['id'],
          name: script['name'],
          custom: false,
        ),
    ]);
    batch.deleteAll(db.scriptCharacter);
    batch.insertAll<ScriptCharacter, ScriptCharacterData>(db.scriptCharacter, [
      for (final script in data)
        for (final characterId in script['characters'] as List)
          ScriptCharacterCompanion.insert(
            scriptId: script['id'],
            characterId: characterId,
          ),
    ]);
  });
}

Future<void> initDatabase(Database db) async {
  await initCharacters(db);
  await initScripts(db);
}
