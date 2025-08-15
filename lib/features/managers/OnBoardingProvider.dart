import 'package:flutter/cupertino.dart';

import '../../data/repositories/onBoardingReposrtory.dart';

class OnBoardingProvider extends ChangeNotifier {
  final OnBoardingRepository _repository;

  OnBoardingProvider(this._repository) {
    getOnBoarding();
    getRecipe();
  }

  bool isLoading = false;
  List onBoarding = [];
  List recipe = [];

  Future<void> getOnBoarding() async {
    isLoading = true;
    notifyListeners();

    try {
      onBoarding = await _repository.getOnBoarding();
    } catch (e) {
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> getRecipe() async {
    isLoading = true;
    notifyListeners();

    try {
      recipe = await _repository.getRecipe(limit: 6);
    } catch (e) {
    }

    isLoading = false;
    notifyListeners();
  }
}
