import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repositories/Auth/AuthenticationRepository.dart';

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

    await result.fold(
      (error) {
        errorMessage = error.toString();
        isSuccess = false;
      },
      (token) async {
        if (token.isNotEmpty) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("token", token);
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
    return isSuccess;
  }
}
