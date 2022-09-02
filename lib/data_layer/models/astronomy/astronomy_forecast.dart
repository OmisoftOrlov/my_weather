// ignore_for_file: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather/data_layer/models/astronomy/day_astronomy_forecast.dart';

part 'astronomy_forecast.g.dart';

@JsonSerializable()
class AstronomyForecast {
  @JsonKey(name: "timezone")
  final String timeZone;
  @JsonKey(name: "tzoffset")
  final double tzOffset;
  @JsonKey(name: "days")
  final List<DayAstronomyForecast> daysAstronomyForecast;

  AstronomyForecast({
    required this.timeZone,
    required this.tzOffset,
    required this.daysAstronomyForecast,
  });

  DayAstronomyForecast getAstronomyForecastByDate(DateTime dateTime) =>
      daysAstronomyForecast
          .firstWhere((forecast) => forecast.dateTime.day == dateTime.day);

  factory AstronomyForecast.fromJson(Map<String, dynamic> json) =>
      _$AstronomyForecastFromJson(json);

  Map<String, dynamic> toJson() => _$AstronomyForecastToJson(this);

  @override
  String toString() {
    return "AstronomyForecast: $timeZone, $tzOffset, $daysAstronomyForecast";
  }
}
