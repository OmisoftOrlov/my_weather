import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_weather/data_layer/models/exceptions/network_exceptions.dart';

import '../../data_layer/models/weather/weather.dart';
import '../../data_layer/repositories/weather_repository.dart';

part 'weather_forecast_state.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  final WeatherRepository weatherRepository;

  WeatherForecastCubit({required this.weatherRepository})
      : super(WeatherForecastLoading()) {
    weatherRepository
        .getWeatherForecastByLocation()
        .then((weather) => _emitWeatherForecast(weather))
        .catchError((error) {
      _emitLoadingFailure((error as NetworkException).message);
    });
  }

  void _emitWeatherForecast(Weather weather) =>
      emit(WeatherForecastLoaded(weather: weather));

  void _emitLoadingFailure(String errorMessage) =>
      emit(WeatherForecastLoadingFailed(errorMessage: errorMessage));
}
