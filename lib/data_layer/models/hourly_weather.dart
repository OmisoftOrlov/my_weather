// ignore_for_file: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'enums/precipitation_type.dart';

part 'hourly_weather.g.dart';

@JsonSerializable()
class HourlyWeather {
  @JsonKey(name: "datetimeEpoch", fromJson: _fromJson, toJson: _toJson)
  final DateTime dateTime;
  @JsonKey(name: "temp")
  final double temperature;
  @JsonKey(name: "feelslike")
  final double feelsLike;
  final double humidity;
  @JsonKey(defaultValue: 0.0, name: "precipprob")
  final double precipitationProbability;
  @JsonKey(defaultValue: PrecipitationType.noPrecipitation, name: "preciptype")
  final PrecipitationType precipType;
  @JsonKey(name: "windspeed")
  final double windSpeed;
  @JsonKey(name: "winddir")
  final double windDirection;
  final double pressure;
  final String conditions;
  final String icon;

  HourlyWeather({
    required this.dateTime,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.precipitationProbability,
    required this.precipType,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.conditions,
    required this.icon,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherToJson(this);

  static DateTime _fromJson(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch((timestamp * 1000));
  static int _toJson(DateTime dateTime) => dateTime.millisecondsSinceEpoch;

  @override
  String toString() {
    return "Hourly weather: $dateTime, $temperature, $feelsLike, $humidity, $precipitationProbability, ${precipType.name} $windSpeed, $windDirection, $pressure, $conditions, $icon";
  }
}
