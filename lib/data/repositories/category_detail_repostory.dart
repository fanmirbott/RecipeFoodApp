// import 'package:dio/dio.dart';
// import '../models/Cuisene_model_recipe.dart';
//
// class CategoriesDetailRepository {
//   final Dio _dio = _dio;
//   Future<List<CuisineModelRecipe>> getCategoriesDetail(int categoryId) async {
//     Response response = await _dio.get("/recipes/list?Category=$categoryId");
//     return (response.data as List)
//         .map((x) => CuisineModelRecipe.fromJson(x))
//         .toList();
//   }
//
//   Future<List<dynamic>> getCategories() async {
//     Response response = await _dio.get("/categories/list");
//     return response.data;
//   }
// }
