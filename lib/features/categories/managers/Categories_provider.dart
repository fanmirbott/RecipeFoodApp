import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/data/models/cuisene_model.dart';
import '../../../data/repositories/categoriesRepostory.dart';

class CategoriesViewModel extends ChangeNotifier {
  final CategoriesRepository _repository;

  CategoriesViewModel(this._repository) {
    getCategories();
  }

  bool isLoading = false;
  List<CuisineModel> products = [];

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    products = await _repository.getCategories();

    isLoading = false;
    notifyListeners();
  }
}
