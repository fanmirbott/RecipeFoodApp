import '../../../core/cleint.dart';
import '../../models/chefs/chefsModel.dart';
import '../../models/recipe/RecipeModel.dart';

class TrendingRepository {
  final ApiClient client;

  TrendingRepository({required this.client});

  Future<TrendingRecipeModel> getTrendingRecipe() async {
    final result = await client.get<Map<String, dynamic>>("/recipes/trending-recipe");

    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => TrendingRecipeModel.fromJson(data),
    );
  }
  Future<List<TrendingModel>> getCategories() async {
    final result = await client.get<List<dynamic>>("/recipes/list?Category=2&Limit=4");

    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data.map((x) => TrendingModel.fromJson(x)).toList(),
    );
  }

  Future<List<TopChefModel>> getTopChefsTrend() async {
    final result = await client.get<List<dynamic>>(
      "/top-chefs/list",
      queryParams: {"Limit": 4},
    );

    return result.fold(
          (error) => throw Exception(error),
          (data) => data.map((x) => TopChefModel.fromJson(x)).toList(),
    );
  }
}
