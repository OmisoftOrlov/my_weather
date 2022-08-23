import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider {
  final Position _currentPosition;
  final Placemark _currentPlace;

  LocationProvider(this._currentPosition, this._currentPlace);

  static Future<LocationProvider> getInstance() async {
    Position position;
    Placemark placemark;
    position = await _determinePosition();
    placemark =
        await _getAddressFromLatLng(position.latitude, position.longitude);

    return Future.value(LocationProvider(position, placemark));
  }

  String get currentLocation {
    return "Current location: ${_currentPosition.latitude}, ${_currentPosition.longitude}";
  }

  String get currentPlace {
    return "Current place: ${_currentPlace.name}, ${_currentPlace.country}";
  }

  static Future<Position> _determinePosition() async {
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

  static Future<Placemark> _getAddressFromLatLng(
      double latitude, double longitude) async {
    return await placemarkFromCoordinates(latitude, longitude).then(
      (p) => Future.value(p[0]),
      onError: (e) => Future.value(e.toString()),
    );
  }
}
