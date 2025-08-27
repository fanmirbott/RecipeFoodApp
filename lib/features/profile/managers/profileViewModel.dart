import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/data/repositories/profileRepostory.dart';

import '../../../data/models/profile/profileModel.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepository repository;

  ProfileViewModel(this.repository);

  bool isLoading = false;
  ProfileModel? profile;

  Future<void> getProfileDetails() async {
    isLoading = true;
    notifyListeners();

    try {
      profile = await repository.getProfileDetails();
      print('Profile: ${profile?.username}');
    } catch (e) {
      print('Error: $e');
      profile = null;
    }

    isLoading = false;
    notifyListeners();
  }
}
