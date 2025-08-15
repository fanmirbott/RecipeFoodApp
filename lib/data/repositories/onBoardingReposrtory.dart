import 'package:recipefoodapp/core/cleint.dart';

class OnBoardingRepository {
  final ApiClient _client;

  OnBoardingRepository(this._client);

  Future<List<dynamic>> getOnBoarding() async {
    final result = await _client.get<List<dynamic>>("/onboarding/list");

    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data,
    );
  }

  Future<List<dynamic>> getRecipe({int limit = 6}) async {
    final result = await _client.get<List<dynamic>>(
      "/categories/list",
      queryParams: {"Limit": limit},
    );

    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data,
    );
  }
}
