class Condition {
  final String typeId;
  final String description;
  final String imagePath;

  Condition._(this.typeId, this.description, this.imagePath);

  factory Condition.fromType(String type) {
    String description;
    String imagePath;
    switch (type) {
      case "type_1":
        description = "Blowing Or Drifting Snow";
        imagePath = "";
        break;
      case "type_2":
        description = "Drizzle";
        imagePath = "";
        break;
      case "type_3":
        description = "Heavy Drizzle";
        imagePath = "";
        break;
      case "type_4":
        description = "Light Drizzle";
        imagePath = "";
        break;
      case "type_5":
        description = "Heavy Drizzle/Rain";
        imagePath = "";
        break;
      case "type_6":
        description = "Light Drizzle/Rain";
        imagePath = "";
        break;
      case "type_7":
        description = "Dust storm";
        imagePath = "";
        break;
      case "type_8":
        description = "Fog";
        imagePath = "";
        break;
      case "type_9":
        description = "Freezing Drizzle/Freezing Rain";
        imagePath = "";
        break;
      case "type_10":
        description = "Heavy Freezing Drizzle/Freezing Rain";
        imagePath = "";
        break;
      case "type_11":
        description = "Light Freezing Drizzle/Freezing Rain";
        imagePath = "";
        break;
      case "type_12":
        description = "Freezing Fog";
        imagePath = "";
        break;
      case "type_13":
        description = "Heavy Freezing Rain";
        imagePath = "";
        break;
      case "type_14":
        description = "Light Freezing Rain";
        imagePath = "";
        break;
      case "type_15":
        description = "Funnel Cloud/Tornado";
        imagePath = "";
        break;
      case "type_16":
        description = "Hail Showers";
        imagePath = "";
        break;
      case "type_17":
        description = "Ice";
        imagePath = "";
        break;
      case "type_18":
        description = "Lightning Without Thunder";
        imagePath = "";
        break;
      case "type_19":
        description = "Mist";
        imagePath = "";
        break;
      case "type_20":
        description = "Precipitation In Vicinity";
        imagePath = "";
        break;
      case "type_21":
        description = "Rain";
        imagePath = "";
        break;
      case "type_22":
        description = "Heavy Rain And Snow";
        imagePath = "";
        break;
      case "type_23":
        description = "Light Rain And Snow";
        imagePath = "";
        break;
      case "type_24":
        description = "Rain Showers";
        imagePath = "";
        break;
      case "type_25":
        description = "Heavy Rain";
        imagePath = "";
        break;
      case "type_26":
        description = "Light Rain";
        imagePath = "";
        break;
      case "type_27":
        description = "Sky Coverage Decreasing";
        imagePath = "";
        break;
      case "type_28":
        description = "Sky Coverage Increasing";
        imagePath = "";
        break;
      case "type_29":
        description = "Sky Unchanged";
        imagePath = "";
        break;
      case "type_30":
        description = "Smoke Or Haze";
        imagePath = "";
        break;
      case "type_31":
        description = "Snow";
        imagePath = "";
        break;
      case "type_32":
        description = "Snow And Rain Showers";
        imagePath = "";
        break;
      case "type_33":
        description = "Snow Showers";
        imagePath = "";
        break;
      case "type_34":
        description = "Heavy Snow";
        imagePath = "";
        break;
      case "type_35":
        description = "Light Snow";
        imagePath = "";
        break;
      case "type_36":
        description = "Squalls";
        imagePath = "";
        break;
      case "type_37":
        description = "Thunderstorm";
        imagePath = "";
        break;
      case "type_38":
        description = "Thunderstorm Without Precipitation";
        imagePath = "";
        break;
      case "type_39":
        description = "Diamond Dust";
        imagePath = "";
        break;
      case "type_40":
        description = "Hail";
        imagePath = "";
        break;
      case "type_41":
        description = "Overcast";
        imagePath = "";
        break;
      case "type_42":
        description = "Partially cloudy";
        imagePath = "";
        break;
      case "type_43":
        description = "Clear";
        imagePath = "";
        break;
      default:
        description = "Weather conditions undefined";
        imagePath = "";
    }
    return Condition._(type, description, imagePath);
  }

  @override
  String toString() {
    return "Condition: $typeId, $description, $imagePath";
  }
}
