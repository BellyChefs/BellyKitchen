// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MealResponse _$$_MealResponseFromJson(Map<String, dynamic> json) =>
    _$_MealResponse(
      result: (json['result'] as List<dynamic>)
          .map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MealResponseToJson(_$_MealResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
