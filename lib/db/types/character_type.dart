import 'package:drift/drift.dart';

import 'character_alignment.dart';

enum CharacterType {
  info('Info', null),
  townsfolk('Townsfolk', CharacterAlignment.good),
  outsider('Outsider', CharacterAlignment.good),
  minion('Minion', CharacterAlignment.evil),
  demon('Demon', CharacterAlignment.evil),
  traveller('Traveller', null),
  fabled('Fabled', null);

  const CharacterType(this.title, this.alignment);

  final String title;
  final CharacterAlignment? alignment;
}

class CharacterTypeConverter extends TypeConverter<CharacterType, String>
    with JsonTypeConverter<CharacterType, String> {
  const CharacterTypeConverter();

  @override
  CharacterType fromSql(fromDb) {
    return CharacterType.values.firstWhere((e) => e.name == fromDb);
  }

  @override
  String toSql(value) => value.name;

  @override
  CharacterType fromJson(String json) => fromSql(json);

  @override
  String toJson(CharacterType value) => toSql(value);
}
