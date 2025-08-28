import 'package:flutter/cupertino.dart';
import '../../../data/models/chefs/chefsModel.dart';
import '../../../data/repositories/chef/chefDetailRepostory.dart';

class ChefDetailViewModel extends ChangeNotifier {
  final ChefDetailRepository _repository;

  ChefDetailViewModel(
    this._repository,
  );

  bool isLoading = false;
  var chefs = {};

  ChefsModel? chef;

  Future<void> getChefDetails(int id) async {
    isLoading = true;
    notifyListeners();

    chef = await _repository.getChefDetails(id);
    chef = null;
    isLoading = false;
    notifyListeners();
  }
}
