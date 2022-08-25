// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      dateTime: CurrentWeather._fromJson(json['datetimeEpoch'] as int),
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
      conditions:
          CurrentWeather._conditionFromJson(json['conditions'] as String),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'datetimeEpoch': CurrentWeather._toJson(instance.dateTime),
      'temp': instance.temperature,
      'feelslike': instance.feelsLike,
      'humidity': instance.humidity,
      'precipprob': instance.precipitationProbability,
      'preciptype': _$PrecipitationTypeEnumMap[instance.precipType]!,
      'windspeed': instance.windSpeed,
      'winddir': instance.windDirection,
      'pressure': instance.pressure,
      'conditions': CurrentWeather._conditionToJson(instance.conditions),
    };

const _$PrecipitationTypeEnumMap = {
  PrecipitationType.noPrecipitation: 'noPrecipitation',
  PrecipitationType.rain: 'rain',
  PrecipitationType.snow: 'snow',
  PrecipitationType.freezingrain: 'freezingrain',
  PrecipitationType.ice: 'ice',
};
