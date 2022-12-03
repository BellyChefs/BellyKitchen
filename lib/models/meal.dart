import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
abstract class Meal with _$Meal {
  @Freezed(makeCollectionsUnmodifiable: false)
  factory Meal({
    required String title,
    required int calories,
    required List<dynamic> category,
    required String video,
    required String time,
    required String image,
    required double rate,
    required String mealId,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
