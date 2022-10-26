// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'character_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OptionItem _$OptionItemFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'label':
      return OptionLabelItem.fromJson(json);
    case 'character':
      return OptionCharacterItem.fromJson(json);
    case 'alignment':
      return OptionAlignmentItem.fromJson(json);
    case 'select':
      return OptionSelectItem.fromJson(json);
    case 'number':
      return OptionNumberItem.fromJson(json);
    case 'text':
      return OptionTextItem.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'OptionItem', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$OptionItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) label,
    required TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)
        character,
    required TResult Function(CharacterAlignment? value) alignment,
    required TResult Function(List<String> items, int? value) select,
    required TResult Function(int? value, int? min, int? max) number,
    required TResult Function(String? value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? label,
    TResult? Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult? Function(CharacterAlignment? value)? alignment,
    TResult? Function(List<String> items, int? value)? select,
    TResult? Function(int? value, int? min, int? max)? number,
    TResult? Function(String? value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? label,
    TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult Function(CharacterAlignment? value)? alignment,
    TResult Function(List<String> items, int? value)? select,
    TResult Function(int? value, int? min, int? max)? number,
    TResult Function(String? value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionLabelItem value) label,
    required TResult Function(OptionCharacterItem value) character,
    required TResult Function(OptionAlignmentItem value) alignment,
    required TResult Function(OptionSelectItem value) select,
    required TResult Function(OptionNumberItem value) number,
    required TResult Function(OptionTextItem value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OptionLabelItem value)? label,
    TResult? Function(OptionCharacterItem value)? character,
    TResult? Function(OptionAlignmentItem value)? alignment,
    TResult? Function(OptionSelectItem value)? select,
    TResult? Function(OptionNumberItem value)? number,
    TResult? Function(OptionTextItem value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionLabelItem value)? label,
    TResult Function(OptionCharacterItem value)? character,
    TResult Function(OptionAlignmentItem value)? alignment,
    TResult Function(OptionSelectItem value)? select,
    TResult Function(OptionNumberItem value)? number,
    TResult Function(OptionTextItem value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionItemCopyWith<$Res> {
  factory $OptionItemCopyWith(
          OptionItem value, $Res Function(OptionItem) then) =
      _$OptionItemCopyWithImpl<$Res, OptionItem>;
}

/// @nodoc
class _$OptionItemCopyWithImpl<$Res, $Val extends OptionItem>
    implements $OptionItemCopyWith<$Res> {
  _$OptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OptionLabelItemCopyWith<$Res> {
  factory _$$OptionLabelItemCopyWith(
          _$OptionLabelItem value, $Res Function(_$OptionLabelItem) then) =
      __$$OptionLabelItemCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$OptionLabelItemCopyWithImpl<$Res>
    extends _$OptionItemCopyWithImpl<$Res, _$OptionLabelItem>
    implements _$$OptionLabelItemCopyWith<$Res> {
  __$$OptionLabelItemCopyWithImpl(
      _$OptionLabelItem _value, $Res Function(_$OptionLabelItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$OptionLabelItem(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionLabelItem implements OptionLabelItem {
  const _$OptionLabelItem(this.value, {final String? $type})
      : $type = $type ?? 'label';

  factory _$OptionLabelItem.fromJson(Map<String, dynamic> json) =>
      _$$OptionLabelItemFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'OptionItem.label(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionLabelItem &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionLabelItemCopyWith<_$OptionLabelItem> get copyWith =>
      __$$OptionLabelItemCopyWithImpl<_$OptionLabelItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) label,
    required TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)
        character,
    required TResult Function(CharacterAlignment? value) alignment,
    required TResult Function(List<String> items, int? value) select,
    required TResult Function(int? value, int? min, int? max) number,
    required TResult Function(String? value) text,
  }) {
    return label(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? label,
    TResult? Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult? Function(CharacterAlignment? value)? alignment,
    TResult? Function(List<String> items, int? value)? select,
    TResult? Function(int? value, int? min, int? max)? number,
    TResult? Function(String? value)? text,
  }) {
    return label?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? label,
    TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult Function(CharacterAlignment? value)? alignment,
    TResult Function(List<String> items, int? value)? select,
    TResult Function(int? value, int? min, int? max)? number,
    TResult Function(String? value)? text,
    required TResult orElse(),
  }) {
    if (label != null) {
      return label(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionLabelItem value) label,
    required TResult Function(OptionCharacterItem value) character,
    required TResult Function(OptionAlignmentItem value) alignment,
    required TResult Function(OptionSelectItem value) select,
    required TResult Function(OptionNumberItem value) number,
    required TResult Function(OptionTextItem value) text,
  }) {
    return label(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OptionLabelItem value)? label,
    TResult? Function(OptionCharacterItem value)? character,
    TResult? Function(OptionAlignmentItem value)? alignment,
    TResult? Function(OptionSelectItem value)? select,
    TResult? Function(OptionNumberItem value)? number,
    TResult? Function(OptionTextItem value)? text,
  }) {
    return label?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionLabelItem value)? label,
    TResult Function(OptionCharacterItem value)? character,
    TResult Function(OptionAlignmentItem value)? alignment,
    TResult Function(OptionSelectItem value)? select,
    TResult Function(OptionNumberItem value)? number,
    TResult Function(OptionTextItem value)? text,
    required TResult orElse(),
  }) {
    if (label != null) {
      return label(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionLabelItemToJson(
      this,
    );
  }
}

abstract class OptionLabelItem implements OptionItem {
  const factory OptionLabelItem(final String value) = _$OptionLabelItem;

  factory OptionLabelItem.fromJson(Map<String, dynamic> json) =
      _$OptionLabelItem.fromJson;

  String get value;
  @JsonKey(ignore: true)
  _$$OptionLabelItemCopyWith<_$OptionLabelItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OptionCharacterItemCopyWith<$Res> {
  factory _$$OptionCharacterItemCopyWith(_$OptionCharacterItem value,
          $Res Function(_$OptionCharacterItem) then) =
      __$$OptionCharacterItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
          List<ScriptFilter> filter,
      String? value});
}

/// @nodoc
class __$$OptionCharacterItemCopyWithImpl<$Res>
    extends _$OptionItemCopyWithImpl<$Res, _$OptionCharacterItem>
    implements _$$OptionCharacterItemCopyWith<$Res> {
  __$$OptionCharacterItemCopyWithImpl(
      _$OptionCharacterItem _value, $Res Function(_$OptionCharacterItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? value = freezed,
  }) {
    return _then(_$OptionCharacterItem(
      null == filter
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<ScriptFilter>,
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionCharacterItem implements OptionCharacterItem {
  const _$OptionCharacterItem(
      @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
          final List<ScriptFilter> filter,
      this.value,
      {final String? $type})
      : _filter = filter,
        $type = $type ?? 'character';

  factory _$OptionCharacterItem.fromJson(Map<String, dynamic> json) =>
      _$$OptionCharacterItemFromJson(json);

// ignore: invalid_annotation_target
  final List<ScriptFilter> _filter;
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
  List<ScriptFilter> get filter {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filter);
  }

  @override
  final String? value;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'OptionItem.character(filter: $filter, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionCharacterItem &&
            const DeepCollectionEquality().equals(other._filter, _filter) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filter), value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionCharacterItemCopyWith<_$OptionCharacterItem> get copyWith =>
      __$$OptionCharacterItemCopyWithImpl<_$OptionCharacterItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) label,
    required TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)
        character,
    required TResult Function(CharacterAlignment? value) alignment,
    required TResult Function(List<String> items, int? value) select,
    required TResult Function(int? value, int? min, int? max) number,
    required TResult Function(String? value) text,
  }) {
    return character(filter, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? label,
    TResult? Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult? Function(CharacterAlignment? value)? alignment,
    TResult? Function(List<String> items, int? value)? select,
    TResult? Function(int? value, int? min, int? max)? number,
    TResult? Function(String? value)? text,
  }) {
    return character?.call(filter, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? label,
    TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult Function(CharacterAlignment? value)? alignment,
    TResult Function(List<String> items, int? value)? select,
    TResult Function(int? value, int? min, int? max)? number,
    TResult Function(String? value)? text,
    required TResult orElse(),
  }) {
    if (character != null) {
      return character(filter, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionLabelItem value) label,
    required TResult Function(OptionCharacterItem value) character,
    required TResult Function(OptionAlignmentItem value) alignment,
    required TResult Function(OptionSelectItem value) select,
    required TResult Function(OptionNumberItem value) number,
    required TResult Function(OptionTextItem value) text,
  }) {
    return character(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OptionLabelItem value)? label,
    TResult? Function(OptionCharacterItem value)? character,
    TResult? Function(OptionAlignmentItem value)? alignment,
    TResult? Function(OptionSelectItem value)? select,
    TResult? Function(OptionNumberItem value)? number,
    TResult? Function(OptionTextItem value)? text,
  }) {
    return character?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionLabelItem value)? label,
    TResult Function(OptionCharacterItem value)? character,
    TResult Function(OptionAlignmentItem value)? alignment,
    TResult Function(OptionSelectItem value)? select,
    TResult Function(OptionNumberItem value)? number,
    TResult Function(OptionTextItem value)? text,
    required TResult orElse(),
  }) {
    if (character != null) {
      return character(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionCharacterItemToJson(
      this,
    );
  }
}

abstract class OptionCharacterItem implements OptionItem {
  const factory OptionCharacterItem(
      @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
          final List<ScriptFilter> filter,
      final String? value) = _$OptionCharacterItem;

  factory OptionCharacterItem.fromJson(Map<String, dynamic> json) =
      _$OptionCharacterItem.fromJson;

// ignore: invalid_annotation_target
  @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
  List<ScriptFilter> get filter;
  String? get value;
  @JsonKey(ignore: true)
  _$$OptionCharacterItemCopyWith<_$OptionCharacterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OptionAlignmentItemCopyWith<$Res> {
  factory _$$OptionAlignmentItemCopyWith(_$OptionAlignmentItem value,
          $Res Function(_$OptionAlignmentItem) then) =
      __$$OptionAlignmentItemCopyWithImpl<$Res>;
  @useResult
  $Res call({CharacterAlignment? value});
}

/// @nodoc
class __$$OptionAlignmentItemCopyWithImpl<$Res>
    extends _$OptionItemCopyWithImpl<$Res, _$OptionAlignmentItem>
    implements _$$OptionAlignmentItemCopyWith<$Res> {
  __$$OptionAlignmentItemCopyWithImpl(
      _$OptionAlignmentItem _value, $Res Function(_$OptionAlignmentItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$OptionAlignmentItem(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as CharacterAlignment?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionAlignmentItem implements OptionAlignmentItem {
  const _$OptionAlignmentItem(this.value, {final String? $type})
      : $type = $type ?? 'alignment';

  factory _$OptionAlignmentItem.fromJson(Map<String, dynamic> json) =>
      _$$OptionAlignmentItemFromJson(json);

  @override
  final CharacterAlignment? value;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'OptionItem.alignment(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionAlignmentItem &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionAlignmentItemCopyWith<_$OptionAlignmentItem> get copyWith =>
      __$$OptionAlignmentItemCopyWithImpl<_$OptionAlignmentItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) label,
    required TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)
        character,
    required TResult Function(CharacterAlignment? value) alignment,
    required TResult Function(List<String> items, int? value) select,
    required TResult Function(int? value, int? min, int? max) number,
    required TResult Function(String? value) text,
  }) {
    return alignment(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? label,
    TResult? Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult? Function(CharacterAlignment? value)? alignment,
    TResult? Function(List<String> items, int? value)? select,
    TResult? Function(int? value, int? min, int? max)? number,
    TResult? Function(String? value)? text,
  }) {
    return alignment?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? label,
    TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult Function(CharacterAlignment? value)? alignment,
    TResult Function(List<String> items, int? value)? select,
    TResult Function(int? value, int? min, int? max)? number,
    TResult Function(String? value)? text,
    required TResult orElse(),
  }) {
    if (alignment != null) {
      return alignment(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionLabelItem value) label,
    required TResult Function(OptionCharacterItem value) character,
    required TResult Function(OptionAlignmentItem value) alignment,
    required TResult Function(OptionSelectItem value) select,
    required TResult Function(OptionNumberItem value) number,
    required TResult Function(OptionTextItem value) text,
  }) {
    return alignment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OptionLabelItem value)? label,
    TResult? Function(OptionCharacterItem value)? character,
    TResult? Function(OptionAlignmentItem value)? alignment,
    TResult? Function(OptionSelectItem value)? select,
    TResult? Function(OptionNumberItem value)? number,
    TResult? Function(OptionTextItem value)? text,
  }) {
    return alignment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionLabelItem value)? label,
    TResult Function(OptionCharacterItem value)? character,
    TResult Function(OptionAlignmentItem value)? alignment,
    TResult Function(OptionSelectItem value)? select,
    TResult Function(OptionNumberItem value)? number,
    TResult Function(OptionTextItem value)? text,
    required TResult orElse(),
  }) {
    if (alignment != null) {
      return alignment(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionAlignmentItemToJson(
      this,
    );
  }
}

abstract class OptionAlignmentItem implements OptionItem {
  const factory OptionAlignmentItem(final CharacterAlignment? value) =
      _$OptionAlignmentItem;

  factory OptionAlignmentItem.fromJson(Map<String, dynamic> json) =
      _$OptionAlignmentItem.fromJson;

  CharacterAlignment? get value;
  @JsonKey(ignore: true)
  _$$OptionAlignmentItemCopyWith<_$OptionAlignmentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OptionSelectItemCopyWith<$Res> {
  factory _$$OptionSelectItemCopyWith(
          _$OptionSelectItem value, $Res Function(_$OptionSelectItem) then) =
      __$$OptionSelectItemCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> items, int? value});
}

/// @nodoc
class __$$OptionSelectItemCopyWithImpl<$Res>
    extends _$OptionItemCopyWithImpl<$Res, _$OptionSelectItem>
    implements _$$OptionSelectItemCopyWith<$Res> {
  __$$OptionSelectItemCopyWithImpl(
      _$OptionSelectItem _value, $Res Function(_$OptionSelectItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? value = freezed,
  }) {
    return _then(_$OptionSelectItem(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionSelectItem implements OptionSelectItem {
  const _$OptionSelectItem(final List<String> items, this.value,
      {final String? $type})
      : _items = items,
        $type = $type ?? 'select';

  factory _$OptionSelectItem.fromJson(Map<String, dynamic> json) =>
      _$$OptionSelectItemFromJson(json);

  final List<String> _items;
  @override
  List<String> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int? value;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'OptionItem.select(items: $items, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionSelectItem &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionSelectItemCopyWith<_$OptionSelectItem> get copyWith =>
      __$$OptionSelectItemCopyWithImpl<_$OptionSelectItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) label,
    required TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)
        character,
    required TResult Function(CharacterAlignment? value) alignment,
    required TResult Function(List<String> items, int? value) select,
    required TResult Function(int? value, int? min, int? max) number,
    required TResult Function(String? value) text,
  }) {
    return select(items, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? label,
    TResult? Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult? Function(CharacterAlignment? value)? alignment,
    TResult? Function(List<String> items, int? value)? select,
    TResult? Function(int? value, int? min, int? max)? number,
    TResult? Function(String? value)? text,
  }) {
    return select?.call(items, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? label,
    TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult Function(CharacterAlignment? value)? alignment,
    TResult Function(List<String> items, int? value)? select,
    TResult Function(int? value, int? min, int? max)? number,
    TResult Function(String? value)? text,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(items, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionLabelItem value) label,
    required TResult Function(OptionCharacterItem value) character,
    required TResult Function(OptionAlignmentItem value) alignment,
    required TResult Function(OptionSelectItem value) select,
    required TResult Function(OptionNumberItem value) number,
    required TResult Function(OptionTextItem value) text,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OptionLabelItem value)? label,
    TResult? Function(OptionCharacterItem value)? character,
    TResult? Function(OptionAlignmentItem value)? alignment,
    TResult? Function(OptionSelectItem value)? select,
    TResult? Function(OptionNumberItem value)? number,
    TResult? Function(OptionTextItem value)? text,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionLabelItem value)? label,
    TResult Function(OptionCharacterItem value)? character,
    TResult Function(OptionAlignmentItem value)? alignment,
    TResult Function(OptionSelectItem value)? select,
    TResult Function(OptionNumberItem value)? number,
    TResult Function(OptionTextItem value)? text,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionSelectItemToJson(
      this,
    );
  }
}

abstract class OptionSelectItem implements OptionItem {
  const factory OptionSelectItem(final List<String> items, final int? value) =
      _$OptionSelectItem;

  factory OptionSelectItem.fromJson(Map<String, dynamic> json) =
      _$OptionSelectItem.fromJson;

  List<String> get items;
  int? get value;
  @JsonKey(ignore: true)
  _$$OptionSelectItemCopyWith<_$OptionSelectItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OptionNumberItemCopyWith<$Res> {
  factory _$$OptionNumberItemCopyWith(
          _$OptionNumberItem value, $Res Function(_$OptionNumberItem) then) =
      __$$OptionNumberItemCopyWithImpl<$Res>;
  @useResult
  $Res call({int? value, int? min, int? max});
}

/// @nodoc
class __$$OptionNumberItemCopyWithImpl<$Res>
    extends _$OptionItemCopyWithImpl<$Res, _$OptionNumberItem>
    implements _$$OptionNumberItemCopyWith<$Res> {
  __$$OptionNumberItemCopyWithImpl(
      _$OptionNumberItem _value, $Res Function(_$OptionNumberItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_$OptionNumberItem(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionNumberItem implements OptionNumberItem {
  const _$OptionNumberItem(this.value, this.min, this.max,
      {final String? $type})
      : $type = $type ?? 'number';

  factory _$OptionNumberItem.fromJson(Map<String, dynamic> json) =>
      _$$OptionNumberItemFromJson(json);

  @override
  final int? value;
  @override
  final int? min;
  @override
  final int? max;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'OptionItem.number(value: $value, min: $min, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionNumberItem &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, min, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionNumberItemCopyWith<_$OptionNumberItem> get copyWith =>
      __$$OptionNumberItemCopyWithImpl<_$OptionNumberItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) label,
    required TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)
        character,
    required TResult Function(CharacterAlignment? value) alignment,
    required TResult Function(List<String> items, int? value) select,
    required TResult Function(int? value, int? min, int? max) number,
    required TResult Function(String? value) text,
  }) {
    return number(value, min, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? label,
    TResult? Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult? Function(CharacterAlignment? value)? alignment,
    TResult? Function(List<String> items, int? value)? select,
    TResult? Function(int? value, int? min, int? max)? number,
    TResult? Function(String? value)? text,
  }) {
    return number?.call(value, min, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? label,
    TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult Function(CharacterAlignment? value)? alignment,
    TResult Function(List<String> items, int? value)? select,
    TResult Function(int? value, int? min, int? max)? number,
    TResult Function(String? value)? text,
    required TResult orElse(),
  }) {
    if (number != null) {
      return number(value, min, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionLabelItem value) label,
    required TResult Function(OptionCharacterItem value) character,
    required TResult Function(OptionAlignmentItem value) alignment,
    required TResult Function(OptionSelectItem value) select,
    required TResult Function(OptionNumberItem value) number,
    required TResult Function(OptionTextItem value) text,
  }) {
    return number(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OptionLabelItem value)? label,
    TResult? Function(OptionCharacterItem value)? character,
    TResult? Function(OptionAlignmentItem value)? alignment,
    TResult? Function(OptionSelectItem value)? select,
    TResult? Function(OptionNumberItem value)? number,
    TResult? Function(OptionTextItem value)? text,
  }) {
    return number?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionLabelItem value)? label,
    TResult Function(OptionCharacterItem value)? character,
    TResult Function(OptionAlignmentItem value)? alignment,
    TResult Function(OptionSelectItem value)? select,
    TResult Function(OptionNumberItem value)? number,
    TResult Function(OptionTextItem value)? text,
    required TResult orElse(),
  }) {
    if (number != null) {
      return number(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionNumberItemToJson(
      this,
    );
  }
}

abstract class OptionNumberItem implements OptionItem {
  const factory OptionNumberItem(
      final int? value, final int? min, final int? max) = _$OptionNumberItem;

  factory OptionNumberItem.fromJson(Map<String, dynamic> json) =
      _$OptionNumberItem.fromJson;

  int? get value;
  int? get min;
  int? get max;
  @JsonKey(ignore: true)
  _$$OptionNumberItemCopyWith<_$OptionNumberItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OptionTextItemCopyWith<$Res> {
  factory _$$OptionTextItemCopyWith(
          _$OptionTextItem value, $Res Function(_$OptionTextItem) then) =
      __$$OptionTextItemCopyWithImpl<$Res>;
  @useResult
  $Res call({String? value});
}

/// @nodoc
class __$$OptionTextItemCopyWithImpl<$Res>
    extends _$OptionItemCopyWithImpl<$Res, _$OptionTextItem>
    implements _$$OptionTextItemCopyWith<$Res> {
  __$$OptionTextItemCopyWithImpl(
      _$OptionTextItem _value, $Res Function(_$OptionTextItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$OptionTextItem(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionTextItem implements OptionTextItem {
  const _$OptionTextItem(this.value, {final String? $type})
      : $type = $type ?? 'text';

  factory _$OptionTextItem.fromJson(Map<String, dynamic> json) =>
      _$$OptionTextItemFromJson(json);

  @override
  final String? value;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'OptionItem.text(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionTextItem &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionTextItemCopyWith<_$OptionTextItem> get copyWith =>
      __$$OptionTextItemCopyWithImpl<_$OptionTextItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) label,
    required TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)
        character,
    required TResult Function(CharacterAlignment? value) alignment,
    required TResult Function(List<String> items, int? value) select,
    required TResult Function(int? value, int? min, int? max) number,
    required TResult Function(String? value) text,
  }) {
    return text(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? label,
    TResult? Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult? Function(CharacterAlignment? value)? alignment,
    TResult? Function(List<String> items, int? value)? select,
    TResult? Function(int? value, int? min, int? max)? number,
    TResult? Function(String? value)? text,
  }) {
    return text?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? label,
    TResult Function(
            @JsonKey(fromJson: fromScriptFilterJson, toJson: toScriptFilterJson)
                List<ScriptFilter> filter,
            String? value)?
        character,
    TResult Function(CharacterAlignment? value)? alignment,
    TResult Function(List<String> items, int? value)? select,
    TResult Function(int? value, int? min, int? max)? number,
    TResult Function(String? value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionLabelItem value) label,
    required TResult Function(OptionCharacterItem value) character,
    required TResult Function(OptionAlignmentItem value) alignment,
    required TResult Function(OptionSelectItem value) select,
    required TResult Function(OptionNumberItem value) number,
    required TResult Function(OptionTextItem value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OptionLabelItem value)? label,
    TResult? Function(OptionCharacterItem value)? character,
    TResult? Function(OptionAlignmentItem value)? alignment,
    TResult? Function(OptionSelectItem value)? select,
    TResult? Function(OptionNumberItem value)? number,
    TResult? Function(OptionTextItem value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionLabelItem value)? label,
    TResult Function(OptionCharacterItem value)? character,
    TResult Function(OptionAlignmentItem value)? alignment,
    TResult Function(OptionSelectItem value)? select,
    TResult Function(OptionNumberItem value)? number,
    TResult Function(OptionTextItem value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionTextItemToJson(
      this,
    );
  }
}

abstract class OptionTextItem implements OptionItem {
  const factory OptionTextItem(final String? value) = _$OptionTextItem;

  factory OptionTextItem.fromJson(Map<String, dynamic> json) =
      _$OptionTextItem.fromJson;

  String? get value;
  @JsonKey(ignore: true)
  _$$OptionTextItemCopyWith<_$OptionTextItem> get copyWith =>
      throw _privateConstructorUsedError;
}

ScriptFilter _$ScriptFilterFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'type':
      return ScriptTypeFilter.fromJson(json);
    case 'character':
      return ScriptCharacterFilter.fromJson(json);
    case 'alignment':
      return ScriptAlignmentFilter.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ScriptFilter',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ScriptFilter {
  ScriptFilterType get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScriptFilterType type, CharacterType value) type,
    required TResult Function(ScriptFilterType type, String value) character,
    required TResult Function(ScriptFilterType type, CharacterAlignment value)
        alignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScriptFilterType type, CharacterType value)? type,
    TResult? Function(ScriptFilterType type, String value)? character,
    TResult? Function(ScriptFilterType type, CharacterAlignment value)?
        alignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScriptFilterType type, CharacterType value)? type,
    TResult Function(ScriptFilterType type, String value)? character,
    TResult Function(ScriptFilterType type, CharacterAlignment value)?
        alignment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScriptTypeFilter value) type,
    required TResult Function(ScriptCharacterFilter value) character,
    required TResult Function(ScriptAlignmentFilter value) alignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScriptTypeFilter value)? type,
    TResult? Function(ScriptCharacterFilter value)? character,
    TResult? Function(ScriptAlignmentFilter value)? alignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScriptTypeFilter value)? type,
    TResult Function(ScriptCharacterFilter value)? character,
    TResult Function(ScriptAlignmentFilter value)? alignment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScriptFilterCopyWith<ScriptFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScriptFilterCopyWith<$Res> {
  factory $ScriptFilterCopyWith(
          ScriptFilter value, $Res Function(ScriptFilter) then) =
      _$ScriptFilterCopyWithImpl<$Res, ScriptFilter>;
  @useResult
  $Res call({ScriptFilterType type});
}

/// @nodoc
class _$ScriptFilterCopyWithImpl<$Res, $Val extends ScriptFilter>
    implements $ScriptFilterCopyWith<$Res> {
  _$ScriptFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScriptFilterType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScriptTypeFilterCopyWith<$Res>
    implements $ScriptFilterCopyWith<$Res> {
  factory _$$ScriptTypeFilterCopyWith(
          _$ScriptTypeFilter value, $Res Function(_$ScriptTypeFilter) then) =
      __$$ScriptTypeFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScriptFilterType type, CharacterType value});
}

/// @nodoc
class __$$ScriptTypeFilterCopyWithImpl<$Res>
    extends _$ScriptFilterCopyWithImpl<$Res, _$ScriptTypeFilter>
    implements _$$ScriptTypeFilterCopyWith<$Res> {
  __$$ScriptTypeFilterCopyWithImpl(
      _$ScriptTypeFilter _value, $Res Function(_$ScriptTypeFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$ScriptTypeFilter(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScriptFilterType,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as CharacterType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScriptTypeFilter implements ScriptTypeFilter {
  const _$ScriptTypeFilter(this.type, this.value);

  factory _$ScriptTypeFilter.fromJson(Map<String, dynamic> json) =>
      _$$ScriptTypeFilterFromJson(json);

  @override
  final ScriptFilterType type;
  @override
  final CharacterType value;

  @override
  String toString() {
    return 'ScriptFilter.type(type: $type, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScriptTypeFilter &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScriptTypeFilterCopyWith<_$ScriptTypeFilter> get copyWith =>
      __$$ScriptTypeFilterCopyWithImpl<_$ScriptTypeFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScriptFilterType type, CharacterType value) type,
    required TResult Function(ScriptFilterType type, String value) character,
    required TResult Function(ScriptFilterType type, CharacterAlignment value)
        alignment,
  }) {
    return type(this.type, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScriptFilterType type, CharacterType value)? type,
    TResult? Function(ScriptFilterType type, String value)? character,
    TResult? Function(ScriptFilterType type, CharacterAlignment value)?
        alignment,
  }) {
    return type?.call(this.type, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScriptFilterType type, CharacterType value)? type,
    TResult Function(ScriptFilterType type, String value)? character,
    TResult Function(ScriptFilterType type, CharacterAlignment value)?
        alignment,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(this.type, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScriptTypeFilter value) type,
    required TResult Function(ScriptCharacterFilter value) character,
    required TResult Function(ScriptAlignmentFilter value) alignment,
  }) {
    return type(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScriptTypeFilter value)? type,
    TResult? Function(ScriptCharacterFilter value)? character,
    TResult? Function(ScriptAlignmentFilter value)? alignment,
  }) {
    return type?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScriptTypeFilter value)? type,
    TResult Function(ScriptCharacterFilter value)? character,
    TResult Function(ScriptAlignmentFilter value)? alignment,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScriptTypeFilterToJson(
      this,
    );
  }
}

abstract class ScriptTypeFilter implements ScriptFilter {
  const factory ScriptTypeFilter(
          final ScriptFilterType type, final CharacterType value) =
      _$ScriptTypeFilter;

  factory ScriptTypeFilter.fromJson(Map<String, dynamic> json) =
      _$ScriptTypeFilter.fromJson;

  @override
  ScriptFilterType get type;
  CharacterType get value;
  @override
  @JsonKey(ignore: true)
  _$$ScriptTypeFilterCopyWith<_$ScriptTypeFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScriptCharacterFilterCopyWith<$Res>
    implements $ScriptFilterCopyWith<$Res> {
  factory _$$ScriptCharacterFilterCopyWith(_$ScriptCharacterFilter value,
          $Res Function(_$ScriptCharacterFilter) then) =
      __$$ScriptCharacterFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScriptFilterType type, String value});
}

/// @nodoc
class __$$ScriptCharacterFilterCopyWithImpl<$Res>
    extends _$ScriptFilterCopyWithImpl<$Res, _$ScriptCharacterFilter>
    implements _$$ScriptCharacterFilterCopyWith<$Res> {
  __$$ScriptCharacterFilterCopyWithImpl(_$ScriptCharacterFilter _value,
      $Res Function(_$ScriptCharacterFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$ScriptCharacterFilter(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScriptFilterType,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScriptCharacterFilter implements ScriptCharacterFilter {
  const _$ScriptCharacterFilter(this.type, this.value);

  factory _$ScriptCharacterFilter.fromJson(Map<String, dynamic> json) =>
      _$$ScriptCharacterFilterFromJson(json);

  @override
  final ScriptFilterType type;
  @override
  final String value;

  @override
  String toString() {
    return 'ScriptFilter.character(type: $type, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScriptCharacterFilter &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScriptCharacterFilterCopyWith<_$ScriptCharacterFilter> get copyWith =>
      __$$ScriptCharacterFilterCopyWithImpl<_$ScriptCharacterFilter>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScriptFilterType type, CharacterType value) type,
    required TResult Function(ScriptFilterType type, String value) character,
    required TResult Function(ScriptFilterType type, CharacterAlignment value)
        alignment,
  }) {
    return character(this.type, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScriptFilterType type, CharacterType value)? type,
    TResult? Function(ScriptFilterType type, String value)? character,
    TResult? Function(ScriptFilterType type, CharacterAlignment value)?
        alignment,
  }) {
    return character?.call(this.type, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScriptFilterType type, CharacterType value)? type,
    TResult Function(ScriptFilterType type, String value)? character,
    TResult Function(ScriptFilterType type, CharacterAlignment value)?
        alignment,
    required TResult orElse(),
  }) {
    if (character != null) {
      return character(this.type, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScriptTypeFilter value) type,
    required TResult Function(ScriptCharacterFilter value) character,
    required TResult Function(ScriptAlignmentFilter value) alignment,
  }) {
    return character(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScriptTypeFilter value)? type,
    TResult? Function(ScriptCharacterFilter value)? character,
    TResult? Function(ScriptAlignmentFilter value)? alignment,
  }) {
    return character?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScriptTypeFilter value)? type,
    TResult Function(ScriptCharacterFilter value)? character,
    TResult Function(ScriptAlignmentFilter value)? alignment,
    required TResult orElse(),
  }) {
    if (character != null) {
      return character(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScriptCharacterFilterToJson(
      this,
    );
  }
}

abstract class ScriptCharacterFilter implements ScriptFilter {
  const factory ScriptCharacterFilter(
          final ScriptFilterType type, final String value) =
      _$ScriptCharacterFilter;

  factory ScriptCharacterFilter.fromJson(Map<String, dynamic> json) =
      _$ScriptCharacterFilter.fromJson;

  @override
  ScriptFilterType get type;
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$ScriptCharacterFilterCopyWith<_$ScriptCharacterFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScriptAlignmentFilterCopyWith<$Res>
    implements $ScriptFilterCopyWith<$Res> {
  factory _$$ScriptAlignmentFilterCopyWith(_$ScriptAlignmentFilter value,
          $Res Function(_$ScriptAlignmentFilter) then) =
      __$$ScriptAlignmentFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScriptFilterType type, CharacterAlignment value});
}

/// @nodoc
class __$$ScriptAlignmentFilterCopyWithImpl<$Res>
    extends _$ScriptFilterCopyWithImpl<$Res, _$ScriptAlignmentFilter>
    implements _$$ScriptAlignmentFilterCopyWith<$Res> {
  __$$ScriptAlignmentFilterCopyWithImpl(_$ScriptAlignmentFilter _value,
      $Res Function(_$ScriptAlignmentFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$ScriptAlignmentFilter(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScriptFilterType,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as CharacterAlignment,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScriptAlignmentFilter implements ScriptAlignmentFilter {
  const _$ScriptAlignmentFilter(this.type, this.value);

  factory _$ScriptAlignmentFilter.fromJson(Map<String, dynamic> json) =>
      _$$ScriptAlignmentFilterFromJson(json);

  @override
  final ScriptFilterType type;
  @override
  final CharacterAlignment value;

  @override
  String toString() {
    return 'ScriptFilter.alignment(type: $type, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScriptAlignmentFilter &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScriptAlignmentFilterCopyWith<_$ScriptAlignmentFilter> get copyWith =>
      __$$ScriptAlignmentFilterCopyWithImpl<_$ScriptAlignmentFilter>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScriptFilterType type, CharacterType value) type,
    required TResult Function(ScriptFilterType type, String value) character,
    required TResult Function(ScriptFilterType type, CharacterAlignment value)
        alignment,
  }) {
    return alignment(this.type, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScriptFilterType type, CharacterType value)? type,
    TResult? Function(ScriptFilterType type, String value)? character,
    TResult? Function(ScriptFilterType type, CharacterAlignment value)?
        alignment,
  }) {
    return alignment?.call(this.type, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScriptFilterType type, CharacterType value)? type,
    TResult Function(ScriptFilterType type, String value)? character,
    TResult Function(ScriptFilterType type, CharacterAlignment value)?
        alignment,
    required TResult orElse(),
  }) {
    if (alignment != null) {
      return alignment(this.type, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScriptTypeFilter value) type,
    required TResult Function(ScriptCharacterFilter value) character,
    required TResult Function(ScriptAlignmentFilter value) alignment,
  }) {
    return alignment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScriptTypeFilter value)? type,
    TResult? Function(ScriptCharacterFilter value)? character,
    TResult? Function(ScriptAlignmentFilter value)? alignment,
  }) {
    return alignment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScriptTypeFilter value)? type,
    TResult Function(ScriptCharacterFilter value)? character,
    TResult Function(ScriptAlignmentFilter value)? alignment,
    required TResult orElse(),
  }) {
    if (alignment != null) {
      return alignment(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScriptAlignmentFilterToJson(
      this,
    );
  }
}

abstract class ScriptAlignmentFilter implements ScriptFilter {
  const factory ScriptAlignmentFilter(
          final ScriptFilterType type, final CharacterAlignment value) =
      _$ScriptAlignmentFilter;

  factory ScriptAlignmentFilter.fromJson(Map<String, dynamic> json) =
      _$ScriptAlignmentFilter.fromJson;

  @override
  ScriptFilterType get type;
  CharacterAlignment get value;
  @override
  @JsonKey(ignore: true)
  _$$ScriptAlignmentFilterCopyWith<_$ScriptAlignmentFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
