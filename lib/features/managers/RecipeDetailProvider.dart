import 'package:flutter/cupertino.dart';

import '../../data/repositories/recipe_detail_repostory.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  final RecipeDetailRepository _repository;
  final int id;

  RecipeDetailViewModel({
    required RecipeDetailRepository repository,
    required this.id,
  }) : _repository = repository {
    getRecipe();
  }

  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic> recipeData = {};

  Future<void> getRecipe() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      recipeData = await _repository.getRecipeDetail(id);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
