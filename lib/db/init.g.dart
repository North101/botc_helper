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
      (json['options'] as List<dynamic>)
          .map((e) => CharacterOptionJson.fromJson(e as Map))
          .toList(),
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
      (json['items'] as List<dynamic>)
          .map((e) => OptionItem.fromJson(e as Map))
          .toList(),
      json['next'] == null
          ? null
          : CharacterOptionItem.fromJson(
              Map<String, dynamic>.from(json['next'] as Map)),
    );

CharacterNightJson _$CharacterNightJsonFromJson(Map json) => CharacterNightJson(
      (json['first_night'] as List<dynamic>)
          .map((e) => CharacterNightReminderJson.fromJson(e as Map))
          .toList(),
      (json['other_night'] as List<dynamic>)
          .map((e) => CharacterNightReminderJson.fromJson(e as Map))
          .toList(),
    );

CharacterNightReminderJson _$CharacterNightReminderJsonFromJson(Map json) =>
    CharacterNightReminderJson(
      json['id'] as String,
      json['reminder'] as String,
    );
