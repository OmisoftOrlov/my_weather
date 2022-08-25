// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      timeZone: json['timezone'] as String,
      tzOffset: (json['tzoffset'] as num).toDouble(),
      days: (json['days'] as List<dynamic>)
          .map((e) => DailyWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentWeather: CurrentWeather.fromJson(
          json['currentConditions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'timezone': instance.timeZone,
      'tzoffset': instance.tzOffset,
      'days': instance.days,
      'currentConditions': instance.currentWeather,
    };
