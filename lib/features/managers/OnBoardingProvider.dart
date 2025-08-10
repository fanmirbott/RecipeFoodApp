import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/cleint.dart';
class OnBoardingProvider extends ChangeNotifier {
  OnBoardingProvider(){
    getOnBoarding();
    getRecipe();
  }


  bool isLoading = false;
  List onBoarding = [];
  List recipe = [];
  Future<void> getOnBoarding() async {
    isLoading = true;
    notifyListeners();
    Response responseData = await dio.get("/onboarding/list");
    onBoarding = responseData.data;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getRecipe() async {
    isLoading = true;
    notifyListeners();
    Response responseData = await dio.get("/categories/list?Limit=6");
    recipe = responseData.data;
    isLoading = false;
    notifyListeners();
  }
}
