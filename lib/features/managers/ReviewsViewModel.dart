import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/data/repositories/ReviewsRepostory.dart';

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
  Map<String, dynamic>? recipeData; // nullable qilindi

  Future<void> getRecipeDetail() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _repository.getRecipeDetail(id);

      recipeData = result; // qiymat berildi
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
