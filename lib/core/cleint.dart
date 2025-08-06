import 'package:dio/dio.dart';

final dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.10.70:8888/api/v1/',
      connectTimeout: Duration(seconds: 3),
      receiveTimeout: Duration(seconds: 5),
    )
);

