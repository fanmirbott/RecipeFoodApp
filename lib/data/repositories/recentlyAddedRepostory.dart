import 'package:recipefoodapp/core/network/cleint.dart';

import '../models/home/RecentlyAddedModel.dart';

class RecentlyAddedRepository {
  final ApiClient _client;

  RecentlyAddedRepository({required ApiClient client}) : _client = client;

  Future<List<RecentlyAddedModel>> getRecentlyAdded() async {
    final result = await _client.get<List<dynamic>>(
      "/recipes/list",
      queryParams: {"Category": 2, "Limit": 2},
    );

    return result.fold(
          (error) => throw Exception(error),
          (data) => data.map((x) => RecentlyAddedModel.fromJson(x)).toList(),
    );
  }
}
