// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hide_character_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HideCharacterArgument _$HideCharacterArgumentFromJson(Map json) =>
    HideCharacterArgument(
      script: scriptFromJson(json['script'] as Map<String, dynamic>),
      characterIdList: (json['characterIdList'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$HideCharacterArgumentToJson(
        HideCharacterArgument instance) =>
    <String, dynamic>{
      'script': scriptToJson(instance.script),
      'characterIdList': instance.characterIdList.toList(),
    };
