import 'package:flutter/cupertino.dart';

import '../../data/repositories/preferencesRepostory.dart';

class PreferencesViewModel extends ChangeNotifier {
  final PreferencesRepository _repository;

  PreferencesViewModel(this._repository) {
    getProductCuisenes();
    getProductAllergic();
  }

  bool isLoading = false;
  List products = [];
  List allergicProducts = [];

  Future<void> getProductCuisenes() async {
    isLoading = true;
    notifyListeners();

    try {
      products = await _repository.getProductCuisenes();
    } catch (e) {
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> getProductAllergic() async {
    isLoading = true;
    notifyListeners();

    try {
      allergicProducts = await _repository.getProductAllergic();
    } catch (e) {
    }

    isLoading = false;
    notifyListeners();
  }
}
