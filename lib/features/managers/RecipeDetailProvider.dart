import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/cleint.dart';
class RecipeDetailProvider extends ChangeNotifier {
  RecipeDetailProvider({required this.id}){
    getRecipe();
  }


  bool isLoading = false;
  Map<String,dynamic> recipeData = {};
  int id;
  Future<void> getRecipe() async {
    isLoading = true;
    notifyListeners();
    Response responseData = await dio.get("/recipes/detail/$id");
    recipeData = responseData.data;
    isLoading = false;
    notifyListeners();
  }
}
