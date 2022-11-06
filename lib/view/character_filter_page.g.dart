// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_filter_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterFilterArguments _$CharacterFilterArgumentsFromJson(Map json) =>
    CharacterFilterArguments(
      script: scriptFromJson(json['script'] as Map<String, dynamic>),
      scriptFilterList:
          scriptFilterListFromJson(json['scriptFilterList'] as List),
    );

Map<String, dynamic> _$CharacterFilterArgumentsToJson(
        CharacterFilterArguments instance) =>
    <String, dynamic>{
      'script': scriptToJson(instance.script),
      'scriptFilterList': scriptFilterListToJson(instance.scriptFilterList),
    };
