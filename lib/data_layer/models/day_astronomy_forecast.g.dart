// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_astronomy_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayAstronomyForecast _$DayAstronomyForecastFromJson(
        Map<String, dynamic> json) =>
    DayAstronomyForecast(
      dateTime: DayAstronomyForecast._fromJson(json['datetimeEpoch'] as int),
      sunriseTime: DayAstronomyForecast._fromJson(json['sunriseEpoch'] as int),
      sunsetTime: DayAstronomyForecast._fromJson(json['sunsetEpoch'] as int),
      moonPhase: (json['moonphase'] as num).toDouble(),
    );

Map<String, dynamic> _$DayAstronomyForecastToJson(
        DayAstronomyForecast instance) =>
    <String, dynamic>{
      'datetimeEpoch': DayAstronomyForecast._toJson(instance.dateTime),
      'sunriseEpoch': DayAstronomyForecast._toJson(instance.sunriseTime),
      'sunsetEpoch': DayAstronomyForecast._toJson(instance.sunsetTime),
      'moonphase': instance.moonPhase,
    };
