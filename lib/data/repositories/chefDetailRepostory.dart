import '../../core/cleint.dart';
import '../models/chefsModel.dart';

class ChefDetailRepository {
  final ApiClient _client;

  ChefDetailRepository({required ApiClient client}) : _client = client;

  Future<ChefsModel> getChefDetails(int id) async {
    final result = await _client.get<Map<String, dynamic>>(
      "/auth/details/$id",
    );
    return result.fold(
          (error) => throw Exception(error),
          (data) => ChefsModel.fromJson(data),
    );
  }
}