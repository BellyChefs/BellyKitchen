import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/meal.dart';
import '../models/meal_response.dart';
import '../repository/repository.dart';

enum Category {
  Category0,
  Category1,
  Category2,
  Category3,
  Category4,
}

final recommendedProvider = FutureProvider<List<Meal>>((ref) async {
  List<Meal> recommendedMeals = await ref.read(repository).getRecommended();
  return recommendedMeals;
});

final mealsProvider = FutureProvider<List<Meal>>((ref) async {
  List<Meal> moreMeals = await ref.read(repository).getMore();
  return moreMeals;
});

final selectedCategoryProvider =
    StateProvider<Category>((ref) => Category.Category0);

final mealByCategoryProvider = FutureProvider<List<Meal>>((ref) async {
  final selectedCategory = ref.watch(searchTextProvider);
  List<Meal> categoryMeals = await ref
      .read(repository)
      .getMealsByCategory(selectedCategory.toString());
  return categoryMeals;
});

final searchTextProvider = StateProvider<String>((ref) => "");

final mealSearchProvider = FutureProvider<List<Meal>>((ref) async {
  final search = ref.watch(searchTextProvider);
  List<Meal> list = [];
  if (search.isNotEmpty) {
    final supabase = Supabase.instance.client;
    final response =
        await supabase.from('recipes').select().ilike('title', '%$search%');
    list = MealResponse.fromJson(response.data).result;
  }
  return list;
});
