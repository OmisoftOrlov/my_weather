import 'package:dio/dio.dart';
import 'package:my_weather/data_layer/models/astronomy_forecast.dart';
import '../../constants/constants.dart';
import '/data_layer/data_providers/location_provider/location_provider.dart';
import '/data_layer/data_providers/weather_provider/logging_interceptor.dart';
import '/data_layer/models/weather.dart';
import '/data_layer/secret_storage/secret_storage.dart';

class WeatherProvider {
  static final WeatherProvider _service = WeatherProvider._internal();
  final LocationProvider _locationProvider = LocationProvider();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
    ),
  )..interceptors.add(LoggerInterceptor());

  WeatherProvider._internal();

  factory WeatherProvider() {
    return _service;
  }

  Future<Weather> getWeatherTodayForecastByLocation() async {
    final userLocation = await _locationProvider.getUserCurrentLocation();
    String endpointPath =
        "${userLocation.latitude},${userLocation.longitude}/today?elements=$queryWeatherElements&key=$weatherApiKey";
    final response = await _dio.get(endpointPath);
    return Weather.fromJson(response.data);
  }

  Future<Weather> getWeather15daysForecastByLocation() async {
    final userLocation = await _locationProvider.getUserCurrentLocation();
    String endpointPath =
        "${userLocation.latitude},${userLocation.longitude}?elements=$queryWeatherElements&key=$weatherApiKey";
    final response = await _dio.get(endpointPath);
    return Weather.fromJson(response.data);
  }

  Future<AstronomyForecast> getAstronomy15daysForecastByLocation() async {
    final userLocation = await _locationProvider.getUserCurrentLocation();
    String endpointPath =
        "${userLocation.latitude},${userLocation.longitude}?elements=$queryAstronomyElements&key=$weatherApiKey";
    final response = await _dio.get(endpointPath);
    return AstronomyForecast.fromJson(response.data);
  }
}
