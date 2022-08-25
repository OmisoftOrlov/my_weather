// ignore_for_file: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'day_astronomy_forecast.g.dart';

@JsonSerializable()
class DayAstronomyForecast {
  @JsonKey(name: "datetimeEpoch", fromJson: _fromJson, toJson: _toJson)
  final DateTime dateTime;
  @JsonKey(name: "sunriseEpoch", fromJson: _fromJson, toJson: _toJson)
  final DateTime sunriseTime;
  @JsonKey(name: "sunsetEpoch", fromJson: _fromJson, toJson: _toJson)
  final DateTime sunsetTime;
  @JsonKey(name: "moonphase")
  final double moonPhase;

  DayAstronomyForecast({
    required this.dateTime,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.moonPhase,
  });

  factory DayAstronomyForecast.fromJson(Map<String, dynamic> json) =>
      _$DayAstronomyForecastFromJson(json);

  Map<String, dynamic> toJson() => _$DayAstronomyForecastToJson(this);

  static DateTime _fromJson(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch((timestamp * 1000));
  static int _toJson(DateTime dateTime) => dateTime.millisecondsSinceEpoch;

  @override
  String toString() {
    return "DayAstronomyForecast: $dateTime, $sunriseTime, $sunsetTime, $moonPhase";
  }
}
