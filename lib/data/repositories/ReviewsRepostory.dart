import 'package:recipefoodapp/core/network/cleint.dart';

class ReviewsRepostory{
  final ApiClient _client;
  ReviewsRepostory(this._client);
  Future<Map<String, dynamic>> getRecipeDetail(int id) async {
    final result = await _client.get<Map<String, dynamic>>("/recipes/reviews/detail/$id");
    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data,
    );
  }
}