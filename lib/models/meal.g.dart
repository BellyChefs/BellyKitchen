// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meal _$$_MealFromJson(Map<String, dynamic> json) => _$_Meal(
      title: json['title'] as String,
      calories: json['calories'] as int,
      category: json['category'] as String,
      video: json['video'] as String,
      time: json['time'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_MealToJson(_$_Meal instance) => <String, dynamic>{
      'title': instance.title,
      'calories': instance.calories,
      'category': instance.category,
      'video': instance.video,
      'time': instance.time,
      'image': instance.image,
    };
