import 'package:recipefoodapp/data/models/profile/profileModel.dart';
import '../../core/network/cleint.dart';

class ProfileRepository {
  final ApiClient _client;

  ProfileRepository({required ApiClient client}) : _client = client;

  Future<ProfileModel> getProfileDetails() async {
    final result = await _client.get<Map<String, dynamic>>("/auth/me");
    return result.fold(
          (error) => throw Exception(error),
          (data) => ProfileModel.fromJson(data),
    );
  }
}
