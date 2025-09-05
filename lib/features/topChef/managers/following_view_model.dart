import 'package:flutter/foundation.dart';

import '../../../data/models/chefs/following_model.dart';
import '../../../data/repositories/chef/following_repository.dart';

class FollowingViewModel extends ChangeNotifier {
  final FollowingRepository repository;

  FollowingViewModel({required this.repository});

  List<FollowingModel> _followings = [];
  List<FollowingModel> get followings => _followings;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchFollowings(int userId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _followings = await repository.getFollowings(userId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
