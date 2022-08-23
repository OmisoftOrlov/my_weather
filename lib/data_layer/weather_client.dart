// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../data_layer/secret_storage/secret_storage.dart';

part 'weather_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class WeatherClient {
  factory WeatherClient(Dio dio, {String baseUrl}) = _WeatherClient;
}