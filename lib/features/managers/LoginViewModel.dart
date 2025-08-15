import 'package:flutter/material.dart';
import '../../data/repositories/AuthenticationRepository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthenticationRepository _repository;

  LoginViewModel(this._repository);

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  Future<void> login(String login, String password) async {
    isLoading = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    final result = await _repository.login(login, password);

    result.fold(
          (error) {
        errorMessage = error as String?;
      },
          (token) {
        successMessage = "Kirish muvaffaqiyatli!";
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
