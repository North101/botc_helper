import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import '/db/database.dart';

part 'restorable.g.dart';

class RestorableSet<E> extends RestorableValue<Iterable<E>> {
  RestorableSet(this._defaultValue);

  final Iterable<E> _defaultValue;

  @override
  Iterable<E> createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(Iterable<E>? oldValue) => notifyListeners();

  @override
  Iterable<E> fromPrimitives(Object? data) => (data as List).toSet().cast();

  @override
  Object? toPrimitives() => value.toList();
}

class RestorableMap<K, V> extends RestorableValue<Map<K, V>> {
  RestorableMap(this._defaultValue);

  final Map<K, V> _defaultValue;

  @override
  Map<K, V> createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(Map<K, V>? oldValue) => notifyListeners();

  @override
  Map<K, V> fromPrimitives(Object? data) => (data as Map).cast();

  @override
  Object? toPrimitives() => value;
}

abstract class RestorableDataClass<T extends DataClass> extends RestorableValue<T> {
  RestorableDataClass(this._defaultValue);

  final T _defaultValue;

  @override
  T createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(T? oldValue) => notifyListeners();

  @override
  Object? toPrimitives() => value.toJson();
}

class RestorableScriptData extends RestorableDataClass<ScriptData> {
  RestorableScriptData(super.defaultValue);

  @override
  ScriptData fromPrimitives(Object? data) => ScriptData.fromJson((data as Map).cast());
}

@JsonSerializable()
class NightSelected {
  const NightSelected({
    required this.firstNight,
    required this.otherNight,
  });

  factory NightSelected.fromJson(Map<String, dynamic> json) => _$NightSelectedFromJson(json);

  final Set<String> firstNight;
  final Set<String> otherNight;

  Set<String> night(bool firstNight) => firstNight ? this.firstNight : otherNight;

  NightSelected copyWith({Set<String>? firstNight, Set<String>? otherNight}) => NightSelected(
        firstNight: firstNight ?? this.firstNight,
        otherNight: otherNight ?? this.otherNight,
      );

  Map<String, dynamic> toJson() => _$NightSelectedToJson(this);
}

class RestorableNightSelected extends RestorableValue<NightSelected> {
  RestorableNightSelected(this._defaultValue);

  final NightSelected _defaultValue;

  @override
  NightSelected createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(NightSelected? oldValue) => notifyListeners();

  @override
  NightSelected fromPrimitives(Object? data) => NightSelected.fromJson((data as Map).cast());

  @override
  Object? toPrimitives() => value.toJson();
}
