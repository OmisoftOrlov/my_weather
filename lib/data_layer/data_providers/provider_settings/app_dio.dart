import 'package:dio/dio.dart';

import 'api_elements.dart';
import '../provider_settings/logging_interceptor.dart';

class AppDio {
  static final AppDio _instance = AppDio._internal();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
    ),
  )..interceptors.add(LoggerInterceptor());

  factory AppDio() {
    return _instance;
  }

  AppDio._internal();

  get client => _dio;
}
