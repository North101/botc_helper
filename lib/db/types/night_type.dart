import 'package:drift/drift.dart';

enum NightType {
  firstNight,
  otherNight;
}

class NightTypeConverter extends TypeConverter<NightType, String> with JsonTypeConverter<NightType, String> {
  const NightTypeConverter();

  @override
  NightType fromSql(fromDb) {
    return NightType.values.firstWhere((e) => e.name == fromDb);
  }

  @override
  String toSql(value) => value.name;

  @override
  NightType fromJson(String json) => fromSql(json);

  @override
  String toJson(NightType value) => toSql(value);
}
