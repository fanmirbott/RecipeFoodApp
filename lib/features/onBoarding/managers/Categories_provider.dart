import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/data/models/cuisene_model.dart';
import '../../../core/cleint.dart';
class Categories_provider extends ChangeNotifier {
  Categories_provider() {
    getCategories();
  }

  bool isLoading = false;
  List<CuisineModel> products = [];
  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();
      Response response = await dio.get("/categories/list");
      products = (response.data as List).map((x)=> CuisineModel.fromJson(x)).toList();
      isLoading = false;
      notifyListeners();
  }
}
