// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_character_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectCharacterArgument _$SelectCharacterArgumentFromJson(Map json) =>
    SelectCharacterArgument(
      script: scriptNFromJson(json['script'] as Map?),
      characterIdList:
          (json['characterIdList'] as List<dynamic>).map((e) => e as String),
    );

Map<String, dynamic> _$SelectCharacterArgumentToJson(
        SelectCharacterArgument instance) =>
    <String, dynamic>{
      'script': scriptNToJson(instance.script),
      'characterIdList': instance.characterIdList.toList(),
    };
