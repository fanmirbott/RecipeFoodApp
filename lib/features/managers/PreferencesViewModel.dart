import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/cleint.dart';

class PreferencesViewModel extends ChangeNotifier{
  PreferencesViewModel(){
    getProductCuisenes();
    getProductAllergic();
  }
  bool isLoading = false;
  List products = [];
  List allergicProducts = [];

  void getProductCuisenes() async {
    isLoading = true;
    notifyListeners();
    Response response = await dio.get("/cuisines/list");
    products = response.data;
    isLoading = false;
    notifyListeners();
  }
  void getProductAllergic() async {
    isLoading = true;
    notifyListeners();
    Response response = await dio.get("/allergic/list");
    allergicProducts = response.data;
    isLoading = false;
    notifyListeners();
  }
}

