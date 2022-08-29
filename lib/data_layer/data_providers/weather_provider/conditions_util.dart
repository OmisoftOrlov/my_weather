bool isNight(DateTime timePoint, DateTime sunrise, DateTime sunset) {
  return timePoint.isAfter(sunrise) && timePoint.isBefore(sunset);
}