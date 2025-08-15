import 'package:recipefoodapp/core/cleint.dart';

class PreferencesRepository {
  final ApiClient _client;

  PreferencesRepository(this._client);

  Future<List<dynamic>> getProductCuisenes() async {
    final result = await _client.get<List<dynamic>>("/cuisines/list");

    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data,
    );
  }

  Future<List<dynamic>> getProductAllergic() async {
    final result = await _client.get<List<dynamic>>("/allergic/list");

    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data,
    );
  }
}
