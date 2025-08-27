import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/network/result.dart';

import '../../../data/models/chefs/chefsModel.dart';

class ChefRepository {
  ChefRepository({
    required ApiClient client,
  }) : _client = client;

  final ApiClient _client;

  Future<Result<List<ChefDetailModel>>> getRecipesByUserId(int userId) async {
    final result = await _client.get<List<dynamic>>(
      "/recipes/list",
      queryParams: {"UserId": userId},
    );

    return result.fold(
          (error) => Result.error(error),
          (data) => Result.ok(
        data.map((x) => ChefDetailModel.fromJson(x)).toList(),
      ),
    );
  }
}

class ChefDetailRecipeViewModel extends ChangeNotifier {
  final ChefRepository _repository;
  final int userId;

  ChefDetailRecipeViewModel({
    required ChefRepository repository,
    required this.userId,
  }) : _repository = repository {
    fetchRecipes();
  }

  bool isLoading = true;
  List<ChefDetailModel> recipes = [];
  String? errorMessage;

  Future<void> fetchRecipes() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repository.getRecipesByUserId(userId);

    result.fold(
          (error) {
        errorMessage = error.toString();
        isLoading = false;
      },
          (data) {
        recipes = data;
        isLoading = false;
      },
    );

    notifyListeners();
  }
}