import '../../strings.dart';

class Condition {
  final String typeId;
  final String description;
  final String imagePath;

  Condition._(this.typeId, this.description, this.imagePath);

  factory Condition.fromType(String type, bool isNight) {
    String description;
    String imagePath;
    switch (type) {
      case "type_1":
        description = Strings.type_1;
        imagePath = "assets/lottie_animations/wind_snow.json";
        break;
      case "type_2":
        description = Strings.type_2;
        imagePath = "assets/lottie_animations/drizzle.json";
        break;
      case "type_3":
        description = Strings.type_3;
        imagePath = isNight
            ? "assets/lottie_animations/extreme_night_drizzle.json"
            : "assets/lottie_animations/extreme_day_drizzle.json";
        break;
      case "type_4":
        description = Strings.type_4;
        imagePath = isNight
            ? "assets/lottie_animations/partly_cloudy_night_drizzle.json"
            : "assets/lottie_animations/partly_cloudy_day_drizzle.json";
        break;
      case "type_5":
        description = Strings.type_5;
        imagePath = isNight
            ? "assets/lottie_animations/extreme_night_rain.json"
            : "assets/lottie_animations/extreme_day_rain.json";
        break;
      case "type_6":
        description = Strings.type_6;
        imagePath = isNight
            ? "assets/lottie_animations/partly_cloudy_night_rain.json"
            : "assets/lottie_animations/partly_cloudy_day_rain.json";
        break;
      case "type_7":
        description = Strings.type_7;
        imagePath = "assets/lottie_animations/dust_wind.json";
        break;
      case "type_8":
        description = Strings.type_8;
        imagePath = isNight
            ? "assets/lottie_animations/fog_night.json"
            : "assets/lottie_animations/fog_day.json";
        break;
      case "type_9":
        description = Strings.type_9;
        imagePath = "assets/lottie_animations/extreme_drizzle.json";
        break;
      case "type_10":
        description = Strings.type_10;
        imagePath = isNight
            ? "assets/lottie_animations/extreme_night_drizzle.json"
            : "assets/lottie_animations/extreme_day_drizzle.json";
        break;
      case "type_11":
        description = Strings.type_11;
        imagePath = isNight
            ? "assets/lottie_animations/partly_cloudy_night_drizzle.json"
            : "assets/lottie_animations/partly_cloudy_day_drizzle.json";
        break;
      case "type_12":
        description = Strings.type_12;
        imagePath = "assets/lottie_animations/extreme_fog.json";
        break;
      case "type_13":
        description = Strings.type_13;
        imagePath = isNight
            ? "assets/lottie_animations/extreme_night_drizzle.json"
            : "assets/lottie_animations/extreme_day_drizzle.json";
        break;
      case "type_14":
        description = Strings.type_14;
        imagePath = isNight
            ? "assets/lottie_animations/partly_cloudy_night_drizzle.json"
            : "assets/lottie_animations/partly_cloudy_day_drizzle.json";
        break;
      case "type_15":
        description = Strings.type_15;
        imagePath = "assets/lottie_animations/tornado.json";
        break;
      case "type_16":
        description = Strings.type_16;
        imagePath = isNight
            ? "assets/lottie_animations/extreme_night_hail.json"
            : "assets/lottie_animations/extreme_day_hail.json";
        break;
      case "type_17":
        description = Strings.type_17;
        imagePath = "assets/lottie_animations/slippery.json";
        break;
      case "type_18":
        description = Strings.type_18;
        imagePath = "assets/lottie_animations/thunderstorms_overcast.json";
        break;
      case "type_19":
        description = Strings.type_19;
        imagePath = "assets/lottie_animations/mist.json";
        break;
      case "type_20":
        description = Strings.type_20;
        imagePath = "assets/lottie_animations/overcast_rain.json";
        break;
      case "type_21":
        description = Strings.type_21;
        imagePath = "assets/lottie_animations/extreme_rain.json";
        break;
      case "type_22":
        description = Strings.type_22;
        imagePath = isNight
            ? "assets/lottie_animations/extreme_night_sleet.json"
            : "assets/lottie_animations/extreme_day_sleet.json";
        break;
      case "type_23":
        description = Strings.type_23;
        imagePath = isNight
            ? "assets/lottie_animations/partly_cloudy_day_sleet.json"
            : "assets/lottie_animations/partly_cloudy_night_sleet.json";
        break;
      case "type_24":
        description = Strings.type_24;
        imagePath = isNight
            ? "assets/lottie_animations/overcast_night_rain.json"
            : "assets/lottie_animations/overcast_day_rain.json";
        break;
      case "type_25":
        description = Strings.type_25;
        imagePath = isNight
            ? "assets/lottie_animations/extreme_night_rain.json"
            : "assets/lottie_animations/extreme_day_rain.json";
        break;
      case "type_26":
        description = Strings.type_26;
        imagePath = isNight
            ? "assets/lottie_animations/partly_cloudy_night_rain.json"
            : "assets/lottie_animations/partly_cloudy_day_rain.json";
        break;
      case "type_27":
        description = Strings.type_27;
        imagePath = "assets/lottie_animations/cloud_down.json";
        break;
      case "type_28":
        description = Strings.type_28;
        imagePath = "assets/lottie_animations/cloud_up.json";
        break;
      case "type_29":
        description = Strings.type_29;
        imagePath = "assets/lottie_animations/cloudy.json";
        break;
      case "type_30":
        description = Strings.type_30;
        imagePath = isNight
            ? "assets/lottie_animations/haze_night.json"
            : "assets/lottie_animations/haze_day.json";
        break;
      case "type_31":
        description = Strings.type_31;
        imagePath = "assets/lottie_animations/extreme_snow.json";
        break;
      case "type_32":
        description = Strings.type_32;
        imagePath = isNight
            ? "assets/lottie_animations/overcast_night_sleet.json"
            : "assets/lottie_animations/overcast_day_sleet.json";
        break;
      case "type_33":
        description = Strings.type_33;
        imagePath = isNight
            ? "assets/lottie_animations/overcast_night_snow.json"
            : "assets/lottie_animations/overcast_day_snow.json";
        break;
      case "type_34":
        description = Strings.type_34;
        imagePath = isNight
            ? "assets/lottie_animations/extreme_night_snow.json"
            : "assets/lottie_animations/extreme_day_snow.json";
        break;
      case "type_35":
        description = Strings.type_35;
        imagePath = isNight
            ? "assets/lottie_animations/partly_cloudy_night_snow.json"
            : "assets/lottie_animations/partly_cloudy_day_snow.json";
        break;
      case "type_36":
        description = Strings.type_36;
        imagePath = "assets/lottie_animations/wind_squalls.json";
        break;
      case "type_37":
        description = Strings.type_37;
        imagePath = isNight
            ? "assets/lottie_animations/thunderstorms_night_overcast_rain.json"
            : "assets/lottie_animations/thunderstorms_day_overcast_rain.json";
        break;
      case "type_38":
        description = Strings.type_38;
        imagePath = isNight
            ? "assets/lottie_animations/thunderstorms_night.json"
            : "assets/lottie_animations/thunderstorms_day.json";
        break;
      case "type_39":
        description = Strings.type_39;
        imagePath = isNight
            ? "assets/lottie_animations/clear_night.json"
            : "assets/lottie_animations/clear_day.json";
        break;
      case "type_40":
        description = Strings.type_40;
        imagePath = "assets/lottie_animations/hail.json";
        break;
      case "type_41":
        description = Strings.type_41;
        imagePath = isNight
            ? "assets/lottie_animations/overcast_night.json"
            : "assets/lottie_animations/overcast_day.json";
        break;
      case "type_42":
        description = Strings.type_42;
        imagePath = isNight
            ? "assets/lottie_animations/partly_cloudy_night.json"
            : "assets/lottie_animations/partly_cloudy_day.json";
        break;
      case "type_43":
        description = Strings.type_43;
        imagePath = isNight
            ? "assets/lottie_animations/clear_night.json"
            : "assets/lottie_animations/clear_day.json";
        break;
      default:
        description = Strings.typeUndefined;
        imagePath = "assets/lottie_animations/undefined.json";
    }
    return Condition._(type, description, imagePath);
  }

  @override
  String toString() {
    return "Condition: $typeId, $description, $imagePath";
  }
}
