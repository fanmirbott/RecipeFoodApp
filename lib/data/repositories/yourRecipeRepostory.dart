import 'package:recipefoodapp/core/network/cleint.dart';
import '../models/recipe/RecipeModel.dart';

class YourRecipeRepository {
  final ApiClient _client;

  YourRecipeRepository(this._client);

  Future<List<YourRecipeModel>> fetchRecipes({int limit = 8}) async {
    final result = await _client.get<List<dynamic>>(
      "/recipes/list",
      queryParams: {"Limit": limit},
    );

    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data.map((item) => YourRecipeModel.fromJson(item)).toList(),
    );
  }
}
