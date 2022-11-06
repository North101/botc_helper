import 'dart:convert';

import 'package:drift/drift.dart' hide JsonKey;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/db/database.dart';

part 'character_option.freezed.dart';
part 'character_option.g.dart';

class CharacterOptionItemConverter extends TypeConverter<CharacterOptionItem, String>
    with JsonTypeConverter2<CharacterOptionItem, String, Map<String, dynamic>> {
  const CharacterOptionItemConverter();

  @override
  CharacterOptionItem fromSql(fromDb) => fromJson((json.decode(fromDb) as Map).cast());

  @override
  String toSql(value) => json.encode(toJson(value));

  @override
  CharacterOptionItem fromJson(Map<String, dynamic> json) => CharacterOptionItem.fromJson(json);

  @override
  Map<String, dynamic> toJson(CharacterOptionItem value) => value.toJson();
}

@JsonSerializable()
class CharacterOptionItem {
  CharacterOptionItem(
    this.items,
    this.next,
  );
  @JsonKey(
    fromJson: characterOptionItemsFromJson,
    toJson: characterOptionItemsToJson,
  )
  final List<OptionItem> items;
  @JsonKey(
    fromJson: characterOptionItemNFromJson,
    toJson: characterOptionItemNToJson,
  )
  final CharacterOptionItem? next;

  factory CharacterOptionItem.fromJson(Map<String, dynamic> json) => _$CharacterOptionItemFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterOptionItemToJson(this);
}

@freezed
class OptionItem with _$OptionItem {
  const factory OptionItem.label(String value) = OptionLabelItem;
  const factory OptionItem.character(
    // ignore: invalid_annotation_target
    @JsonKey(
      fromJson: fromScriptFilterJson,
      toJson: toScriptFilterJson,
    )
        List<ScriptFilter> filter,
    String? value,
  ) = OptionCharacterItem;
  const factory OptionItem.alignment(CharacterAlignment? value) = OptionAlignmentItem;
  const factory OptionItem.select(List<String> items, int? value) = OptionSelectItem;
  const factory OptionItem.number(int? value, int? min, int? max) = OptionNumberItem;
  const factory OptionItem.text(String? value) = OptionTextItem;
  factory OptionItem.fromJson(Map<String, dynamic> json) => _$OptionItemFromJson(json);
}

List<ScriptFilter> fromScriptFilterJson(List json) =>
    json.map((e) => ScriptFilter.fromJson((e as Map).cast())).toList();
List<dynamic> toScriptFilterJson(List<ScriptFilter> json) => json.map((e) => e.toJson()).toList();

enum ScriptFilterType {
  type,
  character,
  alignment,
}

enum CharacterAlignment {
  good('Good', Color(0xff061af5)),
  evil('Evil', Color(0xffb4261a));

  const CharacterAlignment(this.title, this.color);

  final String title;
  final Color color;
}

enum CharacterType {
  info('Info', null),
  townsfolk('Townsfolk', CharacterAlignment.good),
  outsider('Outsider', CharacterAlignment.good),
  minion('Minion', CharacterAlignment.evil),
  demon('Demon', CharacterAlignment.evil),
  traveler('Traveler', null);

  const CharacterType(this.title, this.alignment);

  final String title;
  final CharacterAlignment? alignment;
}

@freezed
class ScriptFilter with _$ScriptFilter {
  const factory ScriptFilter.type(ScriptFilterType type, CharacterType value) = ScriptTypeFilter;
  const factory ScriptFilter.character(ScriptFilterType type, String value) = ScriptCharacterFilter;
  const factory ScriptFilter.alignment(ScriptFilterType type, CharacterAlignment value) = ScriptAlignmentFilter;

  factory ScriptFilter.fromJson(Map<String, Object?> json) => _$ScriptFilterFromJson(json);
}
