part of 'astronomy_forecast_cubit.dart';

abstract class AstronomyForecastState extends Equatable {
  const AstronomyForecastState();

  @override
  List<Object> get props => [];
}

class AstronomyForecastLoading extends AstronomyForecastState {}

class AstronomyForecastLoaded extends AstronomyForecastState {
  final AstronomyForecast astronomyForecast;

  const AstronomyForecastLoaded({required this.astronomyForecast});
}

class AstronomyForecastLoadingFailed extends AstronomyForecastState {
  final String errorMessage;

  const AstronomyForecastLoadingFailed({required this.errorMessage});
}
