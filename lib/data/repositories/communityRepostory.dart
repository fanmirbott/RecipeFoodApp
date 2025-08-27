import 'package:recipefoodapp/core/network/cleint.dart';

import '../models/recipe/RecipeModel.dart';

class CommunityRepository {
  final ApiClient _apiClient;
  // final String category;

  CommunityRepository(this._apiClient,);

  Future<List<CommunityModel>> getCommunity() async {
    final result = await _apiClient.get<List<dynamic>>('/recipes/community/list',);

    return result.fold(
          (error) => throw Exception(error.toString()),
          (value) {
        return (value)
            .map((json) => CommunityModel.fromJson(json))
            .toList();
      },
    );
  }
}
