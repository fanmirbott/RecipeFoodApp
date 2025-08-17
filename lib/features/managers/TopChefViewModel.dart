import 'package:flutter/cupertino.dart';
import '../../data/models/TopChefModel.dart';
import '../../data/models/chefsModel.dart';
import '../../data/repositories/topChefRepostory.dart';

class TopChefViewModel extends ChangeNotifier {
  final TopChefRepository _repository;

  TopChefViewModel(this._repository) {
    getTopChefs();
    getChefs();
    getTopChefsView();
    getTopChefsData();
  }

  bool isLoading = false;
  List<TopChefModel> topChef = [];
  List<TopChefModel> topChefView = [];
  List<TopChefModel> topChefData = [];
  List<ChefsModel> chefs = [];


  Future<void> getTopChefs() async {
    isLoading = true;
    notifyListeners();

    try {
      topChef = await _repository.getTopChefs();
    } catch (e) {
      topChef = [];
    }

    isLoading = false;
    notifyListeners();
  }
  Future<void> getTopChefsView() async {
    isLoading = true;
    notifyListeners();

    try {
      topChefView = await _repository.getTopChefsView();
    } catch (e) {
      topChefView = [];
    }

    isLoading = false;
    notifyListeners();
  }
  Future<void> getTopChefsData() async {
    isLoading = true;
    notifyListeners();

    try {
      topChefData = await _repository.getTopChefsData();
    } catch (e) {
      topChefData = [];
    }

    isLoading = false;
    notifyListeners();
  }
  Future<void> getChefs() async {
    isLoading = true;
    notifyListeners();

    try {
      chefs = await _repository.getChefs();
    } catch (e) {
      chefs = [];
    }

    isLoading = false;
    notifyListeners();
  }

}
