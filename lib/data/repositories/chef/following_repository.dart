import '../../../core/cleint.dart';
import '../../models/chefs/following_model.dart';

class FollowingRepository {
  final ApiClient _client;

  FollowingRepository({required ApiClient client}) : _client = client;

  Future<List<FollowingModel>> getFollowings(int userId) async {
    final result = await _client.get<List<dynamic>>(
      "/auth/followings/$userId",
    );

    return result.fold(
          (error) => throw Exception(error),
          (data) => data.map((e) => FollowingModel.fromJson(e)).toList(),
    );
  }
}
