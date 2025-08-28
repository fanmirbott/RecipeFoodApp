import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/data/models/recipe/RecipeModel.dart';
import '../../../data/repositories/recipe/communityRepostory.dart';

class CommunityViewModel extends ChangeNotifier {
  final CommunityRepository _repository;

  CommunityViewModel(this._repository) {
    getCommunity();
  }

  bool isLoading = false;
  List<bool> likedStates = [];
  List<CommunityModel> recipes = [];

  Future<void> getCommunity() async {
    isLoading = true;
    notifyListeners();
      recipes = await _repository.getCommunity();
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
