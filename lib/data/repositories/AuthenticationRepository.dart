import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/core/utils/result.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required ApiClient client,
  }) : _client = client;
  final ApiClient _client;

  Future<Result<Map<String, dynamic>>> add(Map<String, dynamic> data) async {
    var result = await _client.post('/auth/register', data: data);
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value),
    );
  }

  Future<Result<String>> login(String login, String password) async {
    var response = await _client.post<String>(
      '/auth/login',
      data: {'login': login, 'password': password},
    );
    return response.fold(
      (error) => Result.error(error),
      (success) => Result.ok(success),
    );
  }
}
