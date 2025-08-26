import 'package:flutter/cupertino.dart';
import '../../../data/models/RecentlyAddedModel.dart';
import '../../../data/repositories/recentlyAddedRepostory.dart';

class RecentlyAddedViewModel extends ChangeNotifier {
  final RecentlyAddedRepository _repository;

  RecentlyAddedViewModel(this._repository) {
    getRecentlyAdded();
  }

  bool isLoading = false;
  List<RecentlyAddedModel> recentlyAdded = [];

  Future<void> getRecentlyAdded() async {
    isLoading = true;
    notifyListeners();

    try {
      recentlyAdded = await _repository.getRecentlyAdded();
    } catch (e) {
      recentlyAdded = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
