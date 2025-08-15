import 'package:flutter/material.dart';
import '../../data/repositories/AuthenticationRepository.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthenticationRepository _repository;

  SignUpViewModel(this._repository);

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  Future<void> signUp(Map<String, dynamic> data) async {
    isLoading = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    final result = await _repository.add(data);

    result.fold(
          (error) {
        errorMessage = error as String?;
      },
          (value) {
        successMessage = "Ro‘yxatdan o‘tish muvaffaqiyatli!";
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
