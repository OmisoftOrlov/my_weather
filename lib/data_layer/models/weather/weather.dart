import '../astronomy/astronomy_forecast.dart';
import 'current_weather.dart';
import 'daily_weather.dart';

class Weather {
  final String timeZone;
  final double tzOffset;
  final List<DailyWeather> days;
  final CurrentWeather currentWeather;

  Weather._({
    required this.timeZone,
    required this.tzOffset,
    required this.days,
    required this.currentWeather,
  });

  factory Weather.fromJson(
      Map<String, dynamic> json, AstronomyForecast astronomyForecast) {
    var timeZone = json["timezone"];
    var tzOffset = json["tzoffset"];
    var days = getDailyWeatherListFromJson(json["days"], astronomyForecast);
    var currentWeather =
        CurrentWeather.fromJson(json["currentConditions"], astronomyForecast);

    return Weather._(
        timeZone: timeZone,
        tzOffset: tzOffset,
        days: days,
        currentWeather: currentWeather);
  }

  Map<String, dynamic> toJson() => {
        "timezone": "Europe/Kiev",
        "tzoffset": 3.0,
        "days": convertDailyWeatherListToJson(days),
        "currentConditions": currentWeather.toJson()
      };

  static List<DailyWeather> getDailyWeatherListFromJson(
      List<dynamic> daysList, AstronomyForecast astronomyForecast) {
    List<DailyWeather> days = List.empty(growable: true);
    for (var receivedDay in daysList) {
      days.add(DailyWeather.fromJson(receivedDay, astronomyForecast));
    }
    return days;
  }

  static List<Map<String, dynamic>> convertDailyWeatherListToJson(
      List<DailyWeather> days) {
    List<Map<String, dynamic>> jsonList = List.empty(growable: true);
    for (var day in days) {
      jsonList.add(day.toJson());
    }
    return jsonList;
  }

  @override
  String toString() {
    return "Weather: $timeZone, $tzOffset, $days, $currentWeather";
  }
}
