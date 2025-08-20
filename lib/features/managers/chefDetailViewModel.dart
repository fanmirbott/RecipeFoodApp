import 'package:flutter/cupertino.dart';
import '../../data/models/chefsModel.dart';
import '../../data/repositories/chefDetailRepostory.dart';

class ChefDetailViewModel extends ChangeNotifier {
  final ChefDetailRepository _repository;

  ChefDetailViewModel(this._repository,) {}
  
  bool isLoading = false;
  var chefs = {};

  ChefsModel? chef;

  Future<void> getChefDetails(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      chef = await _repository.getChefDetails(id);
      print('chef$chef');
    } catch (e) {
      print('Error: $e');
      chef = null;
    }
    isLoading = false;
    notifyListeners();
  }


}
