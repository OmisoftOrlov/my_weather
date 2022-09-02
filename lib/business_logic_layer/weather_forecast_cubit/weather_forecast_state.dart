part of 'weather_forecast_cubit.dart';

abstract class WeatherForecastState extends Equatable {
  const WeatherForecastState();

  @override
  List<Object> get props => [];
}

class WeatherForecastLoading extends WeatherForecastState {}

class WeatherForecastLoaded extends WeatherForecastState {
  final Weather weather;

  const WeatherForecastLoaded({required this.weather});
}

class WeatherForecastLoadingFailed extends WeatherForecastState {
  final String errorMessage;

  const WeatherForecastLoadingFailed({required this.errorMessage});
}
