import 'condition.dart';
import '../astronomy/day_astronomy_forecast.dart';
import '../utils/serialization_utils.dart';
import '../enums/precipitation_type.dart';

class HourlyWeather {
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

  HourlyWeather._({
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
  });

  factory HourlyWeather.fromJson(
      Map<String, dynamic> json, DayAstronomyForecast dayAstronomyForecast) {
    var dateTime = dateTimeFromJson(json["datetimeEpoch"]);
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

    return HourlyWeather._(
        dateTime: dateTime,
        temperature: temperature,
        feelsLike: feelsLike,
        humidity: humidity,
        precipitationProbability: precipitationProbability,
        precipTypes: precipTypes,
        windSpeed: windSpeed,
        windDirection: windDirection,
        pressure: pressure,
        conditions: conditions);
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
        "conditions": conditionToJson(conditions)
      };

  @override
  String toString() {
    return "Hourly weather: $dateTime, $temperature, $feelsLike, $humidity, $precipitationProbability, ${precipTypes.toString()} $windSpeed, $windDirection, $pressure, $conditions";
  }
}
