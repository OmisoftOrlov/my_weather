import '../provider_settings/app_dio.dart';

import '../provider_settings/api_elements.dart';
import '../../../secret_storage.dart';
import '../location_provider/location_provider.dart';

class AstronomyProvider {
  static final AstronomyProvider _instance = AstronomyProvider._internal();

  final LocationProvider _locationProvider = LocationProvider();
  final AppDio _appDio = AppDio();

  AstronomyProvider._internal();

  factory AstronomyProvider() {
    return _instance;
  }

  Future<Map<String, dynamic>> getAstronomy15daysForecastByLocation() async {
    final userLocation = await _locationProvider.getUserCurrentLocation();
    String endpointPath =
        "${userLocation.latitude},${userLocation.longitude}?elements=$queryAstronomyElements&key=$weatherApiKey";
    final response = await _appDio.client.get(endpointPath);
    return response.data;
  }
}
