import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data_layer/models/exceptions/network_exceptions.dart';
import '../../../data_layer/repositories/weather_repository.dart';
import '../../data_layer/models/weather/weather.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final WeatherRepository _weatherRepository;

  CurrentWeatherCubit(this._weatherRepository)
      : super(CurrentWeatherLoading()) {
    _weatherRepository
        .getTodayForecastByLocation()
        .then((weather) => _emitWeather(weather))
        .catchError((error) {
      _emitLoadingFailure((error as NetworkException).message);
    });
  }

  void _emitWeather(Weather weather) =>
      emit(CurrentWeatherLoaded(weather: weather));

  void _emitLoadingFailure(String errorMessage) =>
      emit(CurrentWeatherLoadingFailed(errorMessage: errorMessage));
}
