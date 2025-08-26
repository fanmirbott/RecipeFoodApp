import 'package:flutter/cupertino.dart';
import '../../../data/repositories/AuthenticationRepository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthenticationRepository _repository;

  LoginViewModel(this._repository);

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;
  bool isSuccess = false;

  Future<bool> login(String login, String password) async {
    isLoading = true;
    errorMessage = null;
    successMessage = null;
    isSuccess = false;
    notifyListeners();

    final result = await _repository.login(login, password);

    result.fold(
          (error) {
        errorMessage = error.toString();
        isSuccess = false;
      },
          (token) {
        if (token.isNotEmpty) {
          successMessage = "Kirish muvaffaqiyatli!";
          isSuccess = true;
        } else {
          errorMessage = "Login yoki parol noto‘g‘ri";
          isSuccess = false;
        }
      },
    );

    isLoading = false;
    notifyListeners();
    return isSuccess; // UI-ga boolean qaytaryapmiz
  }
}
