// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restorable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NightSelected _$NightSelectedFromJson(Map json) => NightSelected(
      firstNight:
          (json['firstNight'] as List<dynamic>).map((e) => e as String).toSet(),
      otherNight:
          (json['otherNight'] as List<dynamic>).map((e) => e as String).toSet(),
    );

Map<String, dynamic> _$NightSelectedToJson(NightSelected instance) =>
    <String, dynamic>{
      'firstNight': instance.firstNight.toList(),
      'otherNight': instance.otherNight.toList(),
    };
