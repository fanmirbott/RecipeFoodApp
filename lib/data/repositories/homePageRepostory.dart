import '../../core/cleint.dart';
import '../models/HomePageModel.dart';

class HomePageRepository {
  final ApiClient _client;

  HomePageRepository(this._client);

  Future<List<HomePageModel>> getCategories() async {
    final result = await _client.get<List<dynamic>>("/categories/list");

    return result.fold(
          (error) => throw Exception(error.toString()),
          (data) => data.map((item) => HomePageModel.fromJson(item)).toList(),
    );
  }
}
