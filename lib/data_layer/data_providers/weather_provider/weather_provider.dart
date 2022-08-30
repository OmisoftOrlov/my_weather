import '../provider_settings/app_dio.dart';
import '../provider_settings/api_elements.dart';
import '../../data_providers/location_provider/location_provider.dart';
import '/secret_storage.dart';

class WeatherProvider {
  static final WeatherProvider _service = WeatherProvider._internal();
  final LocationProvider _locationProvider = LocationProvider();
  final AppDio _appDio = AppDio();
  WeatherProvider._internal();

  factory WeatherProvider() {
    return _service;
  }

  Future<Map<String, dynamic>> getWeatherTodayForecastByLocation() async {
    final userLocation = await _locationProvider.getUserCurrentLocation();
    String endpointPath =
        "${userLocation.latitude},${userLocation.longitude}/today?elements=$queryWeatherElements&key=$weatherApiKey";
    final response = await _appDio.client.get(endpointPath);
    return response.data;
  }

  Future<Map<String, dynamic>> getWeather15daysForecastByLocation() async {
    final userLocation = await _locationProvider.getUserCurrentLocation();
    String endpointPath =
        "${userLocation.latitude},${userLocation.longitude}?elements=$queryWeatherElements&key=$weatherApiKey";
    final response = await _appDio.client.get(endpointPath);
    return response.data;
  }
}
