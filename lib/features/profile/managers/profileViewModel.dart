import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/data/repositories/profile/profileRepostory.dart';

import '../../../data/models/profile/profileModel.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepository repository;

  ProfileViewModel(this.repository);

  bool isLoading = false;
  ProfileModel? profile;

  Future<void> getProfileDetails() async {
    isLoading = true;
    notifyListeners();
    profile = await repository.getProfileDetails();
    isLoading = false;
    notifyListeners();
  }
}