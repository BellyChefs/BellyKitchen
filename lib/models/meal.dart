import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';

part 'meal.g.dart';

@freezed
abstract class Meal with _$Meal {
  const factory Meal({
    required String title,
    required int calories,
    required String category,
    required String video,
    required String time,
    required String image,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
