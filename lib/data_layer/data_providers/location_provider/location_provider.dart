import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<Placemark> getLocationAddress(
      double latitude, double longitude) async {
    return await placemarkFromCoordinates(latitude, longitude).then(
      (placemarks) => Future.value(placemarks[0]),
      onError: (e) => Future.value(e.toString()),
    );
  }
}
