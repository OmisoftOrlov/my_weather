import '../../../strings.dart';
import '../enums/geolocation_exception_types.dart';

class GeolocationException implements Exception {
  final GeolocationExceptionType type;

  GeolocationException({required this.type});

  String getMessage() {
    String errorMessage;
    switch (type) {
      case GeolocationExceptionType.unavailable:
        errorMessage = Strings.geolocationServicesUnavailable;
        break;
      case GeolocationExceptionType.deniedByUser:
        errorMessage = Strings.geolocationServiceAccessDeniedByUser;
        break;
      case GeolocationExceptionType.permanentlyDeniedByUser:
        errorMessage = Strings.geolocationServiceAccessDeniedPermanently;
        break;
      default:
        errorMessage = Strings.geolocationDefaultError;
    }
    return errorMessage;
  }
}
