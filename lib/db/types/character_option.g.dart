// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterOptionItem _$CharacterOptionItemFromJson(Map json) =>
    CharacterOptionItem(
      characterOptionItemsFromJson(json['items'] as List),
      characterOptionItemNFromJson(json['next'] as Map?),
    );

Map<String, dynamic> _$CharacterOptionItemToJson(
        CharacterOptionItem instance) =>
    <String, dynamic>{
      'items': characterOptionItemsToJson(instance.items),
      'next': characterOptionItemNToJson(instance.next),
    };

_$OptionLabelItem _$$OptionLabelItemFromJson(Map json) => _$OptionLabelItem(
      json['value'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$OptionLabelItemToJson(_$OptionLabelItem instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': instance.$type,
    };

_$OptionCharacterItem _$$OptionCharacterItemFromJson(Map json) =>
    _$OptionCharacterItem(
      fromScriptFilterJson(json['filter'] as List),
      json['value'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$OptionCharacterItemToJson(
        _$OptionCharacterItem instance) =>
    <String, dynamic>{
      'filter': toScriptFilterJson(instance.filter),
      'value': instance.value,
      'type': instance.$type,
    };

_$OptionAlignmentItem _$$OptionAlignmentItemFromJson(Map json) =>
    _$OptionAlignmentItem(
      $enumDecodeNullable(_$CharacterAlignmentEnumMap, json['value']),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$OptionAlignmentItemToJson(
        _$OptionAlignmentItem instance) =>
    <String, dynamic>{
      'value': _$CharacterAlignmentEnumMap[instance.value],
      'type': instance.$type,
    };

const _$CharacterAlignmentEnumMap = {
  CharacterAlignment.good: 'good',
  CharacterAlignment.evil: 'evil',
};

_$OptionSelectItem _$$OptionSelectItemFromJson(Map json) => _$OptionSelectItem(
      (json['items'] as List<dynamic>).map((e) => e as String).toList(),
      json['value'] as int?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$OptionSelectItemToJson(_$OptionSelectItem instance) =>
    <String, dynamic>{
      'items': instance.items,
      'value': instance.value,
      'type': instance.$type,
    };

_$OptionNumberItem _$$OptionNumberItemFromJson(Map json) => _$OptionNumberItem(
      json['value'] as int?,
      json['min'] as int?,
      json['max'] as int?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$OptionNumberItemToJson(_$OptionNumberItem instance) =>
    <String, dynamic>{
      'value': instance.value,
      'min': instance.min,
      'max': instance.max,
      'type': instance.$type,
    };

_$OptionTextItem _$$OptionTextItemFromJson(Map json) => _$OptionTextItem(
      json['value'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$OptionTextItemToJson(_$OptionTextItem instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': instance.$type,
    };

_$ScriptTypeFilter _$$ScriptTypeFilterFromJson(Map json) => _$ScriptTypeFilter(
      $enumDecode(_$ScriptFilterTypeEnumMap, json['type']),
      $enumDecode(_$CharacterTypeEnumMap, json['value']),
    );

Map<String, dynamic> _$$ScriptTypeFilterToJson(_$ScriptTypeFilter instance) =>
    <String, dynamic>{
      'type': _$ScriptFilterTypeEnumMap[instance.type]!,
      'value': _$CharacterTypeEnumMap[instance.value]!,
    };

const _$ScriptFilterTypeEnumMap = {
  ScriptFilterType.type: 'type',
  ScriptFilterType.character: 'character',
  ScriptFilterType.alignment: 'alignment',
};

const _$CharacterTypeEnumMap = {
  CharacterType.info: 'info',
  CharacterType.townsfolk: 'townsfolk',
  CharacterType.outsider: 'outsider',
  CharacterType.minion: 'minion',
  CharacterType.demon: 'demon',
  CharacterType.traveller: 'traveller',
  CharacterType.fabled: 'fabled',
};

_$ScriptCharacterFilter _$$ScriptCharacterFilterFromJson(Map json) =>
    _$ScriptCharacterFilter(
      $enumDecode(_$ScriptFilterTypeEnumMap, json['type']),
      json['value'] as String,
    );

Map<String, dynamic> _$$ScriptCharacterFilterToJson(
        _$ScriptCharacterFilter instance) =>
    <String, dynamic>{
      'type': _$ScriptFilterTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

_$ScriptAlignmentFilter _$$ScriptAlignmentFilterFromJson(Map json) =>
    _$ScriptAlignmentFilter(
      $enumDecode(_$ScriptFilterTypeEnumMap, json['type']),
      $enumDecode(_$CharacterAlignmentEnumMap, json['value']),
    );

Map<String, dynamic> _$$ScriptAlignmentFilterToJson(
        _$ScriptAlignmentFilter instance) =>
    <String, dynamic>{
      'type': _$ScriptFilterTypeEnumMap[instance.type]!,
      'value': _$CharacterAlignmentEnumMap[instance.value]!,
    };
