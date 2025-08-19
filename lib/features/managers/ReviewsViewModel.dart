import 'package:flutter/cupertino.dart';
import '../../data/repositories/recipe_detail_repostory.dart';

class ReviewsViewModel extends ChangeNotifier {
  final RecipeDetailRepository _repository;
  final int id;

  ReviewsViewModel({
    required RecipeDetailRepository repository,
    required this.id,
  }) : _repository = repository {
    getRecipe();
  }

  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? recipeData;

  Future<void> getRecipe() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _repository.getRecipeDetail(id);

      recipeData = result;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
