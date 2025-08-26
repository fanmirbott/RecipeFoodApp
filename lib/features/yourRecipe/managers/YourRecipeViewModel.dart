import 'package:flutter/cupertino.dart';
import '../../../data/models/YourRecipeModel.dart';
import '../../../data/repositories/yourRecipeRepostory.dart';

class YourRecipeViewModel extends ChangeNotifier {
  final YourRecipeRepository _repository;

  YourRecipeViewModel(this._repository) {
    getRecipes();
  }

  bool isLoading = false;
  List<YourRecipeModel> recipes = [];
  List<bool> likedStates = [];

  Future<void> getRecipes() async {
    isLoading = true;
    notifyListeners();

    recipes = await _repository.fetchRecipes();
    likedStates = List.filled(recipes.length, false);

    isLoading = false;
    notifyListeners();
  }


  void toggleLike(int index) {
    if (index < 0 || index >= likedStates.length) return;
    likedStates[index] = !likedStates[index];
    notifyListeners();
  }
}
