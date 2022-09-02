import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/enums/geolocation_exception_types.dart';
import '../../models/exceptions/geolocation_exceptions.dart';

class LocationProvider {
  static final LocationProvider _instance = LocationProvider._internal();

  factory LocationProvider() {
    return _instance;
  }

  LocationProvider._internal();

  Future<Position> getUserCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(
          GeolocationException(type: GeolocationExceptionType.unavailable));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
            GeolocationException(type: GeolocationExceptionType.deniedByUser));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(GeolocationException(
          type: GeolocationExceptionType.permanentlyDeniedByUser));
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<Placemark> getLocationAddress(
      double latitude, double longitude) async {
    return await placemarkFromCoordinates(latitude, longitude).then(
      (placemarks) => Future.value(placemarks[0]),
      onError: (e) => Future.error(Exception(e.toString())),
    );
  }
}
