// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) => DailyWeather(
      dateTime: DailyWeather._fromJson(json['datetimeEpoch'] as int),
      temperature: (json['temp'] as num).toDouble(),
      feelsLike: (json['feelslike'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      precipitationProbability: (json['precipprob'] as num?)?.toDouble() ?? 0.0,
      precipType:
          $enumDecodeNullable(_$PrecipitationTypeEnumMap, json['preciptype']) ??
              PrecipitationType.noPrecipitation,
      windSpeed: (json['windspeed'] as num).toDouble(),
      windDirection: (json['winddir'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      conditions: DailyWeather._conditionFromJson(json['conditions'] as String),
      hours: (json['hours'] as List<dynamic>)
          .map((e) => HourlyWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyWeatherToJson(DailyWeather instance) =>
    <String, dynamic>{
      'datetimeEpoch': DailyWeather._toJson(instance.dateTime),
      'temp': instance.temperature,
      'feelslike': instance.feelsLike,
      'humidity': instance.humidity,
      'precipprob': instance.precipitationProbability,
      'preciptype': _$PrecipitationTypeEnumMap[instance.precipType]!,
      'windspeed': instance.windSpeed,
      'winddir': instance.windDirection,
      'pressure': instance.pressure,
      'conditions': DailyWeather._conditionToJson(instance.conditions),
      'hours': instance.hours,
    };

const _$PrecipitationTypeEnumMap = {
  PrecipitationType.noPrecipitation: 'noPrecipitation',
  PrecipitationType.rain: 'rain',
  PrecipitationType.snow: 'snow',
  PrecipitationType.freezingrain: 'freezingrain',
  PrecipitationType.ice: 'ice',
};
