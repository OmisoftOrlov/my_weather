import '../data_providers/astronomy_provider/astronomy_provider.dart';
import '../models/astronomy_forecast.dart';
import '../models/weather.dart';
import '../data_providers/weather_provider/weather_provider.dart';

class WeatherRepository {
  static final WeatherRepository _instance = WeatherRepository._internal();
  final WeatherProvider _weatherProvider = WeatherProvider();
  final AstronomyProvider _astronomyProvider = AstronomyProvider();

  WeatherRepository._internal();

  factory WeatherRepository() {
    return _instance;
  }

  Future<Weather> getTodayForecastByLocation() async {
    try {
      var astronomyForecast = await getAstronomyForecastByLocation();
      var response = await _weatherProvider.getWeatherTodayForecastByLocation();
      return Weather.fromJson(response, astronomyForecast);
    } catch (e, stacktrace) {
      rethrow;
    } finally {}
  }

  Future<Weather> getWeatherForecastByLocation() async {
    try {
      var astronomyForecast = await getAstronomyForecastByLocation();
      var response =
          await _weatherProvider.getWeather15daysForecastByLocation();
      return Weather.fromJson(response, astronomyForecast);
    } catch (e, stacktrace) {
      rethrow;
    } finally {}
  }

  Future<AstronomyForecast> getAstronomyForecastByLocation() async {
    try {
      var response =
          await _astronomyProvider.getAstronomy15daysForecastByLocation();
      return AstronomyForecast.fromJson(response);
    } catch (e, stacktrace) {
      rethrow;
    } finally {}
  }
}
