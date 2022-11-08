// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScriptJson _$ScriptJsonFromJson(Map json) => ScriptJson(
      json['id'] as String,
      json['name'] as String,
      (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
    );

CharacterJson _$CharacterJsonFromJson(Map json) => CharacterJson(
      json['id'] as String,
      json['name'] as String,
      $enumDecode(_$CharacterTypeEnumMap, json['type']),
      json['description'] as String,
      CharacterJson.optionsFromJson(json['options'] as List),
    );

const _$CharacterTypeEnumMap = {
  CharacterType.info: 'info',
  CharacterType.townsfolk: 'townsfolk',
  CharacterType.outsider: 'outsider',
  CharacterType.minion: 'minion',
  CharacterType.demon: 'demon',
  CharacterType.traveller: 'traveller',
  CharacterType.fabled: 'fabled',
};

CharacterOptionJson _$CharacterOptionJsonFromJson(Map json) =>
    CharacterOptionJson(
      json['title'] as String,
      characterOptionItemsFromJson(json['items'] as List),
      characterOptionItemNFromJson(json['next'] as Map?),
    );

CharacterNightJson _$CharacterNightJsonFromJson(Map json) => CharacterNightJson(
      CharacterNightJson.characterNightReminder(json['first_night'] as List),
      CharacterNightJson.characterNightReminder(json['other_night'] as List),
    );

CharacterNightReminderJson _$CharacterNightReminderJsonFromJson(Map json) =>
    CharacterNightReminderJson(
      json['id'] as String,
      json['reminder'] as String,
    );
