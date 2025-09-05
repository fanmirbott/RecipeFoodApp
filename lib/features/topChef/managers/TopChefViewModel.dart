

import 'package:flutter/cupertino.dart';

import '../../../data/models/chefs/chefsModel.dart';
import '../../../data/repositories/chef/topChefRepostory.dart';

class TopChefViewModel extends ChangeNotifier {
  final TopChefRepository _repository;

  TopChefViewModel(
    this._repository,
  ) {
    getTopChefs();
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

    topChef = await _repository.getTopChefs();

    isLoading = false;
    notifyListeners();
  }

  Future<void> getTopChefsView() async {
    isLoading = true;
    notifyListeners();

    topChefView = await _repository.getTopChefsView();

    isLoading = false;
    notifyListeners();
  }

  Future<void> getTopChefsData() async {
    isLoading = true;
    notifyListeners();

    topChefData = await _repository.getTopChefsData();
    isLoading = false;
    notifyListeners();
  }
}
