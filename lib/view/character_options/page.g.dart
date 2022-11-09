// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterOptionArguments _$CharacterOptionArgumentsFromJson(Map json) =>
    CharacterOptionArguments(
      script: scriptFromJson(json['script'] as Map<String, dynamic>),
      character: characterFromJson(json['character'] as Map<String, dynamic>),
      characterOption: characterOptionItemFromJson(
          json['characterOption'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterOptionArgumentsToJson(
        CharacterOptionArguments instance) =>
    <String, dynamic>{
      'script': scriptToJson(instance.script),
      'character': characterToJson(instance.character),
      'characterOption': characterOptionItemToJson(instance.characterOption),
    };
