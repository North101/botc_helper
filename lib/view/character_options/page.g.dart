// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterOptionArguments _$CharacterOptionArgumentsFromJson(Map json) =>
    CharacterOptionArguments(
      script: scriptFromJson(json['script'] as Map),
      characterOption:
          characterOptionItemFromJson(json['characterOption'] as Map),
    );

Map<String, dynamic> _$CharacterOptionArgumentsToJson(
        CharacterOptionArguments instance) =>
    <String, dynamic>{
      'script': scriptToJson(instance.script),
      'characterOption': characterOptionItemToJson(instance.characterOption),
    };
