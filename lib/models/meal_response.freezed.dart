// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'meal_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MealResponse _$MealResponseFromJson(Map<String, dynamic> json) {
  return _MealResponse.fromJson(json);
}

/// @nodoc
mixin _$MealResponse {
  List<Meal> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MealResponseCopyWith<MealResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealResponseCopyWith<$Res> {
  factory $MealResponseCopyWith(
          MealResponse value, $Res Function(MealResponse) then) =
      _$MealResponseCopyWithImpl<$Res, MealResponse>;
  @useResult
  $Res call({List<Meal> result});
}

/// @nodoc
class _$MealResponseCopyWithImpl<$Res, $Val extends MealResponse>
    implements $MealResponseCopyWith<$Res> {
  _$MealResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MealResponseCopyWith<$Res>
    implements $MealResponseCopyWith<$Res> {
  factory _$$_MealResponseCopyWith(
          _$_MealResponse value, $Res Function(_$_MealResponse) then) =
      __$$_MealResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Meal> result});
}

/// @nodoc
class __$$_MealResponseCopyWithImpl<$Res>
    extends _$MealResponseCopyWithImpl<$Res, _$_MealResponse>
    implements _$$_MealResponseCopyWith<$Res> {
  __$$_MealResponseCopyWithImpl(
      _$_MealResponse _value, $Res Function(_$_MealResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_MealResponse(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MealResponse implements _MealResponse {
  const _$_MealResponse({required final List<Meal> result}) : _result = result;

  factory _$_MealResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MealResponseFromJson(json);

  final List<Meal> _result;
  @override
  List<Meal> get result {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'MealResponse(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MealResponse &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MealResponseCopyWith<_$_MealResponse> get copyWith =>
      __$$_MealResponseCopyWithImpl<_$_MealResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MealResponseToJson(
      this,
    );
  }
}

abstract class _MealResponse implements MealResponse {
  const factory _MealResponse({required final List<Meal> result}) =
      _$_MealResponse;

  factory _MealResponse.fromJson(Map<String, dynamic> json) =
      _$_MealResponse.fromJson;

  @override
  List<Meal> get result;
  @override
  @JsonKey(ignore: true)
  _$$_MealResponseCopyWith<_$_MealResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
