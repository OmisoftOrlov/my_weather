import '../day_astronomy_forecast.dart';

import '../condition.dart';
import '../enums/precipitation_type.dart';

DateTime dateTimeFromJson(int timestamp) =>
    DateTime.fromMillisecondsSinceEpoch((timestamp * 1000));

int dateTimeToJson(DateTime dateTime) => dateTime.millisecondsSinceEpoch;

List<PrecipitationType> precipitationTypesFromJson(List<dynamic>? types) {
  List<PrecipitationType> precipTypes = List.empty(growable: true);
  if (types == null) {
    precipTypes.add(PrecipitationType.noPrecipitation);
  } else {
    for (var receivedType in types) {
      if (receivedType == PrecipitationType.freezingrain.name) {
        precipTypes.add(PrecipitationType.freezingrain);
      } else if (receivedType == PrecipitationType.ice.name) {
        precipTypes.add(PrecipitationType.ice);
      } else if (receivedType == PrecipitationType.rain.name) {
        precipTypes.add(PrecipitationType.rain);
      } else if (receivedType == PrecipitationType.snow.name) {
        precipTypes.add(PrecipitationType.snow);
      }
    }
  }
  return precipTypes;
}

List<String>? precipitationTypeToJson(List<PrecipitationType> list) {
  List<String>? types;
  if (list.contains(PrecipitationType.noPrecipitation)) {
    types = null;
  } else {
    types = List.empty(growable: true);
    for (var precipType in list) {
      types.add(precipType.name);
    }
  }
  return types;
}

List<Condition> conditionFromJson(String conditionsString, DateTime timePoint,
    DayAstronomyForecast dayAstronomyForecast) {
  List<Condition> conditions = List.empty(growable: true);
  List<String> splittedConditions = conditionsString.split(", ");
  bool isNightFlag = isNight(timePoint, dayAstronomyForecast.sunriseTime, dayAstronomyForecast.sunsetTime);
  for (var condition in splittedConditions) {
    conditions.add(Condition.fromType(condition, isNightFlag));
  }
  return conditions;
}

String conditionToJson(List<Condition> conditions) => conditions.join(", ");

bool isNight(DateTime timePoint, DateTime sunrise, DateTime sunset) {
  return timePoint.isAfter(sunrise) && timePoint.isBefore(sunset);
}
