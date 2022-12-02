import 'package:belly_kitchen/models/meal.dart';
import 'package:riverpod/riverpod.dart';

// final clientProvider = Provider((ref) => Dio(BaseOptions(headers: {
//       "apikey": dotenv['API_KEY'],
//     }, baseUrl: 'https://xhmjwwoukqigrerthyql.supabase.co/rest/v1/')));

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
    final List<Meal> recommended = [];
    try {
      return recommended;
    } on Exception catch (error) {
      throw UnimplementedError('lmao bitches $error');
    }
  }

  @override
  Future<List<Meal>> getMore() async {
    throw UnimplementedError('lmao bitches');
  }

  @override
  Future<List<Meal>> getMealsByCategory(String category) async {
    throw UnimplementedError('lmao bitches');
  }
}
