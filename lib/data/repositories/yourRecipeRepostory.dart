import 'package:recipefoodapp/core/cleint.dart';
import '../../data/models/YourRecipeModel.dart';

class YourRecipeRepository {
  final ApiClient _client;

  YourRecipeRepository(this._client);

  Future<List<YourRecipeModel>> fetchRecipes({int limit = 2}) async {
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
