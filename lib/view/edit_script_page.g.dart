// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_script_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditScriptArguments _$EditScriptArgumentsFromJson(Map json) =>
    EditScriptArguments(
      script: scriptFromJson(json['script'] as Map<String, dynamic>),
      characterIdList:
          (json['characterIdList'] as List<dynamic>).map((e) => e as String),
    );

Map<String, dynamic> _$EditScriptArgumentsToJson(
        EditScriptArguments instance) =>
    <String, dynamic>{
      'script': scriptToJson(instance.script),
      'characterIdList': instance.characterIdList.toList(),
    };
