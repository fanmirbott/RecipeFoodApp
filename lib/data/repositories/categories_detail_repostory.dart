import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/core/utils/result.dart';
import 'package:recipefoodapp/data/models/Cuisene_model_recipe.dart';

class CategoriesDetailRepository {
  CategoriesDetailRepository({
    required ApiClient client,
  }) : _client = client;

  final ApiClient _client;

  Future<Result<List<CuisineModelRecipe>>> getCategoriesDetail(int categoryId) async {
    final result = await _client.get<List<dynamic>>(
      "/recipes/list",
      queryParams: {"Category": categoryId},
    );

    return result.fold(
          (error) => Result.error(error),
          (data) => Result.ok(
        data.map((x) => CuisineModelRecipe.fromJson(x)).toList(),
      ),
    );
  }

  Future<Result<List<dynamic>>> getCategories() async {
    final result = await _client.get<List<dynamic>>("/categories/list");

    return result.fold(
          (error) => Result.error(error),
          (data) => Result.ok(data),
    );
  }
}
