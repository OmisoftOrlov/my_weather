import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_elements.dart';
import '../provider_settings/logging_interceptor.dart';

class AppDio {
  static final AppDio _instance = AppDio._internal();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
    ),
  );

  factory AppDio() {
    if (kDebugMode) {}
    return _instance;
  }

  AppDio._internal() {
    if(kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }
  }

  get client => _dio;
}
