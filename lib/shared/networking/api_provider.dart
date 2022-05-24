import 'package:advertisers/shared/networking/custom_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:advertisers/main.dart';
class ApiService {
  static final interceptors = [
    CustomInterceptor(),
    LogInterceptor(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
    )
  ];
  final Dio dioClient = Dio(
    BaseOptions(
      baseUrl: '',
      connectTimeout: 60000,
      receiveTimeout: 60000,
    ),
  )..interceptors.addAll(interceptors);
}
