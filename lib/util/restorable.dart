import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart';

import '/db/database.dart';

class RestorableSet<E> extends RestorableValue<Set<E>> {
  RestorableSet(this._defaultValue);

  final Set<E> _defaultValue;

  @override
  Set<E> createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(Set<E>? oldValue) => notifyListeners();

  @override
  Set<E> fromPrimitives(Object? data) => (data as List).toSet().cast();

  @override
  Object? toPrimitives() => value.toList();
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
