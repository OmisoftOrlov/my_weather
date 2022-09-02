part of 'current_weather_cubit.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object> get props => [];
}

class CurrentWeatherLoading extends CurrentWeatherState {}

class CurrentWeatherLoaded extends CurrentWeatherState {
  final Weather weather;

  const CurrentWeatherLoaded({required this.weather});
}

class CurrentWeatherLoadingFailed extends CurrentWeatherState {
  final String errorMessage;

  const CurrentWeatherLoadingFailed({required this.errorMessage});
}
