// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astronomy_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstronomyForecast _$AstronomyForecastFromJson(Map<String, dynamic> json) =>
    AstronomyForecast(
      timeZone: json['timezone'] as String,
      tzOffset: (json['tzoffset'] as num).toDouble(),
      daysAstronomyForecast: (json['days'] as List<dynamic>)
          .map((e) => DayAstronomyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AstronomyForecastToJson(AstronomyForecast instance) =>
    <String, dynamic>{
      'timezone': instance.timeZone,
      'tzoffset': instance.tzOffset,
      'days': instance.daysAstronomyForecast,
    };
