import 'package:drift/drift.dart';

import 'character_option.dart';

class CharacterTypeConverter extends TypeConverter<CharacterType, String> with JsonTypeConverter<CharacterType, String> {
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
