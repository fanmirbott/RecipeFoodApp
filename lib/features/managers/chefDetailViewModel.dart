import 'package:flutter/cupertino.dart';
import '../../data/models/chefsModel.dart';
import '../../data/repositories/chefDetailRepostory.dart';

class ChefDetailViewModel extends ChangeNotifier {
  final ChefDetailRepository _repository;

  ChefDetailViewModel(this._repository, this.id) {
    getChefs(id);
  }

  final int id;

  bool isLoading = false;
  var chefs = {};

  ChefsModel? chef;

  Future<void> getChefs(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      chef = await _repository.getChefs(id);
    } catch (e) {
      chef = null;
    }
    isLoading = false;
    notifyListeners();
  }


}
