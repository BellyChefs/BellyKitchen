import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../main.dart';
import '../models/meal.dart';
import '../models/meal_response.dart';

final clientProvider = Provider((ref) => Dio(BaseOptions(headers: {
      "apikey": dotenv['API_KEY'],
    }, baseUrl: 'https://xhmjwwoukqigrerthyql.supabase.co/rest/v1/')));

final repository = Provider<RepositoryAPI>((ref) => RepositoryAPI(ref.read));

abstract class Repository {
  Future<List<Meal>> getRecommended();

  Future<List<Meal>> getMore();

  Future<List<Meal>> getMealsByCategory(String category);
}

class RepositoryAPI implements Repository {
  // ignore: deprecated_member_use
  final Reader read;

  RepositoryAPI(this.read);

  @override
  Future<List<Meal>> getRecommended() async {
    List<Meal> recommended = [];
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('recipes').select();
      // final response = await supabase.from('recommended').select();
      print(response.toString());
      response.forEach((element) {
        recommended.add(Meal.fromJson(element));
      });
      //return MealResponse.fromJson(response).result;
      return recommended;
    } on Exception catch (error) {
      throw UnimplementedError('lmao bitches $error');
    }
  }

  @override
  Future<List<Meal>> getMore() async {
    try {
      final response = await read(clientProvider).get('/recipes/');
      return MealResponse.fromJson(response.data).result;
    } on DioError catch (error) {
      throw UnimplementedError('lmao bitches $error');
    }
    // try {
    //   final supabase = Supabase.instance.client;
    //   final response = await supabase.from('recipes').select('*');
    //   return MealResponse.fromJson(response.data).result;
    // } on Exception catch (error) {
    //   throw UnimplementedError('lmao bitches $error');
    // }
  }

  @override
  Future<List<Meal>> getMealsByCategory(String category) async {
    List<Meal> recommended = [];
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('recipes').select();
      // final response = await supabase.from('recommended').select();
      print(response.toString());
      response.forEach((element) {
        recommended.add(Meal.fromJson(element));
      });
      //return MealResponse.fromJson(response).result;
      return recommended;
    } on Exception catch (error) {
      throw UnimplementedError('lmao bitches $error');
    }
    // Вариант через дио (умер потому что ручка лежит)
    // try {
    //   final response = await read(clientProvider).get('/recipes/$category');
    //   return MealResponse.fromJson(response.data).result;
    // } on DioError catch (error) {
    //   throw UnimplementedError('lmao bitches $error');
    // }
    // try {
    //   final supabase = Supabase.instance.client;
    //   final response = await supabase
    //       .from('meals')
    //       .select('*')
    //       .eq('meals.category', category);
    //   return MealResponse.fromJson(response.data).result;
    // } on Exception catch (error) {
    //   throw UnimplementedError('lmao bitches $error');
    // }
  }
}
