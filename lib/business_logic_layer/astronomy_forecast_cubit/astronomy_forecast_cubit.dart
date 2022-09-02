import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data_layer/models/exceptions/network_exceptions.dart';
import '../../data_layer/repositories/weather_repository.dart';
import '../../data_layer/models/astronomy/astronomy_forecast.dart';

part 'astronomy_forecast_state.dart';

class AstronomyForecastCubit extends Cubit<AstronomyForecastState> {
  final WeatherRepository _weatherRepository;

  AstronomyForecastCubit(this._weatherRepository)
      : super(AstronomyForecastLoading()) {
    _weatherRepository
        .getAstronomyForecastByLocation()
        .then((weather) => _emitAstronomyForecast(weather))
        .catchError((error) {
      _emitLoadingFailure((error as NetworkException).message);
    });
  }

  void _emitAstronomyForecast(AstronomyForecast astronomyForecast) =>
      emit(AstronomyForecastLoaded(astronomyForecast: astronomyForecast));

  void _emitLoadingFailure(String errorMessage) =>
      emit(AstronomyForecastLoadingFailed(errorMessage: errorMessage));
}
