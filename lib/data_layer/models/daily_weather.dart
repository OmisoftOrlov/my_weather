import '../models/astronomy_forecast.dart';
import '../models/day_astronomy_forecast.dart';

import '../models/utils/serialization_utils.dart';
import '../models/hourly_weather.dart';
import '../models/condition.dart';
import '../models/enums/precipitation_type.dart';

class DailyWeather {
  final DateTime dateTime;
  final double temperature;
  final double feelsLike;
  final double humidity;
  final double precipitationProbability;
  final List<PrecipitationType> precipTypes;
  final double windSpeed;
  final double windDirection;
  final double pressure;
  final List<Condition> conditions;
  final List<HourlyWeather> hours;

  DailyWeather._({
    required this.dateTime,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.precipitationProbability,
    required this.precipTypes,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.conditions,
    required this.hours,
  });

  factory DailyWeather.fromJson(
      Map<String, dynamic> json, AstronomyForecast astronomyForecast) {
    var dateTime = dateTimeFromJson(json["datetimeEpoch"]);
    var dayAstronomyForecast =
        astronomyForecast.getAstronomyForecastByDate(dateTime);
    var temperature = json["temp"];
    var feelsLike = json["feelslike"];
    var humidity = json["humidity"];
    var precipitationProbability = json["precipprob"] ?? 0.0;
    var precipTypes = precipitationTypesFromJson(json["preciptype"]);
    var windSpeed = json["windspeed"];
    var windDirection = json["winddir"];
    var pressure = json["pressure"];
    var conditions =
        conditionFromJson(json["conditions"], dateTime, dayAstronomyForecast);
    var hours =
        getHourlyWeatherListFromJson(json["hours"], dayAstronomyForecast);

    return DailyWeather._(
        dateTime: dateTime,
        temperature: temperature,
        feelsLike: feelsLike,
        humidity: humidity,
        precipitationProbability: precipitationProbability,
        precipTypes: precipTypes,
        windSpeed: windSpeed,
        windDirection: windDirection,
        pressure: pressure,
        conditions: conditions,
        hours: hours);
  }

  Map<String, dynamic> toJson() => {
        "datetimeEpoch": dateTime,
        "temp": temperature,
        "feelslike": feelsLike,
        "humidity": humidity,
        "precipprob": precipitationProbability,
        "preciptype": precipitationTypeToJson(precipTypes),
        "windspeed": windSpeed,
        "winddir": windDirection,
        "pressure": pressure,
        "conditions": conditionToJson(conditions),
        "hours": convertHourlyWeatherListToJson(hours)
      };

  static List<HourlyWeather> getHourlyWeatherListFromJson(
      List<dynamic> hoursList,
      DayAstronomyForecast dayAstronomyForecast) {
    List<HourlyWeather> hours = List.empty(growable: true);
    for (var receivedHour in hoursList) {
      hours.add(HourlyWeather.fromJson(receivedHour, dayAstronomyForecast));
    }
    return hours;
  }

  static List<Map<String, dynamic>> convertHourlyWeatherListToJson(
      List<HourlyWeather> hours) {
    List<Map<String, dynamic>> jsonList = List.empty(growable: true);
    for (var hour in hours) {
      jsonList.add(hour.toJson());
    }
    return jsonList;
  }

  @override
  String toString() {
    return "Daily weather: $dateTime, $temperature, $feelsLike, $humidity, $precipitationProbability, ${precipTypes.toString()}, $windSpeed, $windDirection, $pressure, $conditions, $hours";
  }
}
