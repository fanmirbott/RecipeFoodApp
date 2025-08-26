import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print(options.data);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print(response.data);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print(err.error);
  }
}
