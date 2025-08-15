import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/models/cuisene_model.dart';

class CategoriesRepository {

  CategoriesRepository({required ApiClient client}) : _client = client;
  final ApiClient _client;


  Future<List<CuisineModel>> getCategories() async {
    final result = await _client.get<List<dynamic>>("/categories/list");

    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data.map((x) => CuisineModel.fromJson(x)).toList(),
    );
  }
}
