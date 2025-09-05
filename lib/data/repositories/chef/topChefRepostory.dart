import '../../../core/cleint.dart';
import '../../models/chefs/chefsModel.dart';

class TopChefRepository {
  final ApiClient _client;

  TopChefRepository({required ApiClient client}) : _client = client;

  Future<List<TopChefModel>> getTopChefs() async {
    final result = await _client.get<List<dynamic>>(
      "/top-chefs/list",
    );
    return result.fold(
      (error) => throw Exception(error),
      (data) => data.map((x) => TopChefModel.fromJson(x)).toList(),
    );
  }

  Future<List<TopChefModel>> getTopChefsView() async {
    final result = await _client.get<List<dynamic>>(
      "/top-chefs/list?Page=3&Limit=2&Order=Views",
      queryParams: {"Limit": 10},
    );
    return result.fold(
      (error) => throw Exception(error),
      (data) => data.map((x) => TopChefModel.fromJson(x)).toList(),
    );
  }

  Future<List<TopChefModel>> getTopChefsData() async {
    final result = await _client.get<List<dynamic>>(
      "/top-chefs/list?Limit=2&Order=Likes",
      queryParams: {"Limit": 10},
    );
    return result.fold(
      (error) => throw Exception(error),
      (data) => data.map((x) => TopChefModel.fromJson(x)).toList(),
    );
  }


}
