import 'package:flutter/cupertino.dart';
import '../../data/models/HomePageModel.dart';
import '../../data/repositories/homePageRepostory.dart';

class HomePageViewModel extends ChangeNotifier {
  final HomePageRepository _repository;

  HomePageViewModel(this._repository) {
    getCategories();
  }

  bool isLoading = false;
  List<HomePageModel> categories = [];

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();
    try {
      categories = await _repository.getCategories();
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
