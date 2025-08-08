import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/data/models/Cuisene_model_recipe.dart';

import '../../../core/cleint.dart';

class Categories_provider_Detail extends ChangeNotifier {
  Categories_provider_Detail({required this.categoryId}) {
    getCategoriesDetail();
    getCategories();
  }

  bool isLoading = false;
  List<CuisineModelRecipe> productsDetail = [];
  List categories = [];
  int categoryId;


  Future<void> getCategoriesDetail() async {

    isLoading = true;
    notifyListeners();
    Response response = await dio.get("/recipes/list?Category=$categoryId");
    productsDetail = (response.data as List).map((x)=> CuisineModelRecipe.fromJson(x)).toList();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getCategories() async{
    isLoading = true;
    notifyListeners();
    Response response = await dio.get("/categories/list");
    categories = response.data;
    isLoading = false;
    notifyListeners();
  }
}
