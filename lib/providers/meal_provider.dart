import 'package:belly_kitchen/models/meal.dart';
import 'package:belly_kitchen/repository/repository.dart';
import 'package:riverpod/riverpod.dart';

enum Category {
  category0,
  category1,
  category2,
  category3,
  category4,
}

final recommendedProvider = FutureProvider<List<Meal>>((ref) async {
  final List<Meal> recommendedMeals = await ref.read(repository).getRecommended();
  return recommendedMeals;
});

final mealsProvider = FutureProvider<List<Meal>>((ref) async {
  final List<Meal> moreMeals = await ref.read(repository).getMore();
  return moreMeals;
});

final selectedCategoryProvider =
    StateProvider<String>((ref) => 'vegs');

final searchTextProvider = StateProvider<String>((ref) => '');

final mealSearchProvider = FutureProvider<List<Meal>>((ref) async {
  //final search = ref.watch(searchTextProvider);
  final List<Meal> list = [];
  return list;
});
