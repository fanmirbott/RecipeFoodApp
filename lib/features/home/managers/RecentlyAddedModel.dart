import 'package:flutter/cupertino.dart';
import '../../../data/models/home/RecentlyAddedModel.dart';
import '../../../data/repositories/home/recentlyAddedRepostory.dart';

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
    recentlyAdded = await _repository.getRecentlyAdded();
    recentlyAdded = [];
    isLoading = false;
    notifyListeners();
  }
}
