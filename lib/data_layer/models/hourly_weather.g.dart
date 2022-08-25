// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyWeather _$HourlyWeatherFromJson(Map<String, dynamic> json) =>
    HourlyWeather(
      dateTime: HourlyWeather._fromJson(json['datetimeEpoch'] as int),
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
      conditions: json['conditions'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$HourlyWeatherToJson(HourlyWeather instance) =>
    <String, dynamic>{
      'datetimeEpoch': HourlyWeather._toJson(instance.dateTime),
      'temp': instance.temperature,
      'feelslike': instance.feelsLike,
      'humidity': instance.humidity,
      'precipprob': instance.precipitationProbability,
      'preciptype': _$PrecipitationTypeEnumMap[instance.precipType]!,
      'windspeed': instance.windSpeed,
      'winddir': instance.windDirection,
      'pressure': instance.pressure,
      'conditions': instance.conditions,
      'icon': instance.icon,
    };

const _$PrecipitationTypeEnumMap = {
  PrecipitationType.noPrecipitation: 'noPrecipitation',
  PrecipitationType.rain: 'rain',
  PrecipitationType.snow: 'snow',
  PrecipitationType.freezingrain: 'freezingrain',
  PrecipitationType.ice: 'ice',
};
