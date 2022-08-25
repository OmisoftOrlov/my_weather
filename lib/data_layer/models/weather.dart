// ignore_for_file: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '/data_layer/models/current_weather.dart';
import '/data_layer/models/daily_weather.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: "timezone")
  final String timeZone;
  @JsonKey(name: "tzoffset")
  final double tzOffset;
  final List<DailyWeather> days;
  @JsonKey(name: "currentConditions")
  final CurrentWeather currentWeather;

  Weather({
    required this.timeZone,
    required this.tzOffset,
    required this.days,
    required this.currentWeather,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  String toString() {
    return "Weather: $timeZone, $tzOffset, $days, $currentWeather";
  }
}
