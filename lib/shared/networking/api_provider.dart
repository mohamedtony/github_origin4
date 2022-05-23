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
      headers: {
        // 'Content-Type': 'application/json',
        // 'Accept-Type': 'application/json',
        "Authorization": storage.read("token"),
        "Accept": "application/json",
        if(storage.read("ownerid")!=null)
          "OwnerID": "${storage.read("ownerid")}",
      },
      connectTimeout: 60000,
      receiveTimeout: 60000,
    ),
  )..interceptors.addAll(interceptors);
}
