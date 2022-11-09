// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPageArguments _$CharacterPageArgumentsFromJson(Map json) =>
    CharacterPageArguments(
      script: scriptFromJson(json['script'] as Map),
      character: characterFromJson(json['character'] as Map),
    );

Map<String, dynamic> _$CharacterPageArgumentsToJson(
        CharacterPageArguments instance) =>
    <String, dynamic>{
      'script': scriptToJson(instance.script),
      'character': characterToJson(instance.character),
    };
