import 'package:flutter/cupertino.dart';
import '../../../data/models/home/HomePageModel.dart';
import '../../../data/repositories/home/homePageRepostory.dart';

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
    categories = await _repository.getCategories();
    isLoading = false;
    notifyListeners();
  }
}
