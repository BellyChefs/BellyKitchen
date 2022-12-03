// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meal _$$_MealFromJson(Map<String, dynamic> json) => _$_Meal(
      title: json['title'] as String,
      calories: json['calories'] as num,
      category: json['category'] as List<dynamic>,
      video: json['video'] as String,
      time: json['time'] as String,
      image: json['image'] as String,
      rate: (json['rate'] as num).toDouble(),
      mealId: json['mealId'] as String,
    );

Map<String, dynamic> _$$_MealToJson(_$_Meal instance) => <String, dynamic>{
      'title': instance.title,
      'calories': instance.calories,
      'category': instance.category,
      'video': instance.video,
      'time': instance.time,
      'image': instance.image,
      'rate': instance.rate,
      'mealId': instance.mealId,
    };
