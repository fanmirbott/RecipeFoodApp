import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/data/repositories/recipe/ReviewsRepostory.dart';

class ReviewsViewModel extends ChangeNotifier {
  final ReviewsRepostory _repository;
  final int id;

  ReviewsViewModel({
    required ReviewsRepostory repository,
    required this.id,
  }) : _repository = repository {
    getRecipeDetail();
  }

  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? recipeData;

  Future<void> getRecipeDetail() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repository.getRecipeDetail(id);

    recipeData = result;
    isLoading = false;
    notifyListeners();
  }
}
