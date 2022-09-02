import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../data_layer/models/exceptions/geolocation_exceptions.dart';
import '../../data_layer/repositories/location_repository.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository _locationRepository;

  LocationCubit(this._locationRepository) : super(LocationLoading()) {
    _locationRepository
        .getUserLocation()
        .then((position) => _emitLoadedPosition(position))
        .catchError((error) {
      _emitLocationLoadingFailure((error as GeolocationException).getMessage());
    });
  }

  void _emitLoadedPosition(Position position) =>
      emit(LocationLoaded(position: position));

  void _emitLocationLoadingFailure(String errorMessage) =>
      emit(LocationLoadingFailed(errorMessage: errorMessage));
}
