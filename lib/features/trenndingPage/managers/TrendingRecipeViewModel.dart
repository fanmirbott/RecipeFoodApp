import 'package:flutter/material.dart';
import '../../../data/models/TopChefModel.dart';
import '../../../data/models/trendingRecipeMOdel.dart';
import '../../../data/models/trendingRecipiesModel.dart';
import '../../../data/repositories/trendingRecipeRepostory.dart';

class TrendingViewModel extends ChangeNotifier {
  final TrendingRepository _repository;

  TrendingViewModel(this._repository) {
    getTrendingRecipe();
    getCategories();
    getTopChefs();
  }

  bool isLoading = false;

  TrendingRecipeModel? trendingRecipe;
  List<TrendingModel> categories = [];
  List<TopChefModel> topChef = [];
  List<bool> likedStates = [];


  Future<void> getTrendingRecipe() async {
    isLoading = true;
    notifyListeners();

    try {
      trendingRecipe = await _repository.getTrendingRecipe();
    } catch (e) {
      trendingRecipe = null;
      debugPrint("Error fetching trending recipe: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      categories = await _repository.getCategories();
      likedStates = List.filled(categories.length, false);

    } catch (e) {
      categories = [];
      debugPrint("Error fetching categories: $e");
    }

    isLoading = false;
    notifyListeners();
  }
  Future<void> getTopChefs() async {
    isLoading = true;
    notifyListeners();

    try {
      topChef = await _repository.getTopChefsTrend();

    } catch (e) {
      topChef = [];
    }

    isLoading = false;
    notifyListeners();
  }
  void toggleLike(int index) {
    if (index < 0 || index >= likedStates.length) return;
    likedStates[index] = !likedStates[index];
    notifyListeners();
  }
}
