import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../data_providers/location_provider/location_provider.dart';
import '../models/enums/geolocation_exception_types.dart';
import '../models/exceptions/geolocation_exceptions.dart';

class LocationRepository {
  static final LocationRepository _instance = LocationRepository._internal();
  final LocationProvider _locationProvider = LocationProvider();

  LocationRepository._internal();

  factory LocationRepository() {
    return _instance;
  }

  Future<Position> getUserLocation() async {
    try {
      var userLocation = _locationProvider.getUserCurrentLocation();
      return userLocation;
    } catch (e) {
      if (e is GeolocationException) {
        rethrow;
      } else {
        throw GeolocationException(type: GeolocationExceptionType.defaultError);
      }
    }
  }

  Future<Placemark> getLocationAddress(
      {required double latitude, required double longitude}) async {
    try {
      var placemark =
          await _locationProvider.getLocationAddress(latitude, longitude);
      return placemark;
    } catch (e) {
      // TODO: need to add error handling;
      rethrow;
    }
  }
}
