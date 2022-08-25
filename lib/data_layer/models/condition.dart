import 'package:my_weather/data_layer/constants/strings.dart';

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
        description = Strings.type_1;
        imagePath = "";
        break;
      case "type_2":
        description = Strings.type_2;
        imagePath = "";
        break;
      case "type_3":
        description = Strings.type_3;
        imagePath = "";
        break;
      case "type_4":
        description = Strings.type_4;
        imagePath = "";
        break;
      case "type_5":
        description = Strings.type_5;
        imagePath = "";
        break;
      case "type_6":
        description = Strings.type_6;
        imagePath = "";
        break;
      case "type_7":
        description = Strings.type_7;
        imagePath = "";
        break;
      case "type_8":
        description = Strings.type_8;
        imagePath = "";
        break;
      case "type_9":
        description = Strings.type_9;
        imagePath = "";
        break;
      case "type_10":
        description = Strings.type_10;
        imagePath = "";
        break;
      case "type_11":
        description = Strings.type_11;
        imagePath = "";
        break;
      case "type_12":
        description = Strings.type_12;
        imagePath = "";
        break;
      case "type_13":
        description = Strings.type_13;
        imagePath = "";
        break;
      case "type_14":
        description = Strings.type_14;
        imagePath = "";
        break;
      case "type_15":
        description = Strings.type_15;
        imagePath = "";
        break;
      case "type_16":
        description = Strings.type_16;
        imagePath = "";
        break;
      case "type_17":
        description = Strings.type_17;
        imagePath = "";
        break;
      case "type_18":
        description = Strings.type_18;
        imagePath = "";
        break;
      case "type_19":
        description = Strings.type_19;
        imagePath = "";
        break;
      case "type_20":
        description = Strings.type_20;
        imagePath = "";
        break;
      case "type_21":
        description = Strings.type_21;
        imagePath = "";
        break;
      case "type_22":
        description = Strings.type_22;
        imagePath = "";
        break;
      case "type_23":
        description = Strings.type_23;
        imagePath = "";
        break;
      case "type_24":
        description = Strings.type_24;
        imagePath = "";
        break;
      case "type_25":
        description = Strings.type_25;
        imagePath = "";
        break;
      case "type_26":
        description = Strings.type_26;
        imagePath = "";
        break;
      case "type_27":
        description = Strings.type_27;
        imagePath = "";
        break;
      case "type_28":
        description = Strings.type_28;
        imagePath = "";
        break;
      case "type_29":
        description = Strings.type_29;
        imagePath = "";
        break;
      case "type_30":
        description = Strings.type_30;
        imagePath = "";
        break;
      case "type_31":
        description = Strings.type_31;
        imagePath = "";
        break;
      case "type_32":
        description = Strings.type_32;
        imagePath = "";
        break;
      case "type_33":
        description = Strings.type_33;
        imagePath = "";
        break;
      case "type_34":
        description = Strings.type_34;
        imagePath = "";
        break;
      case "type_35":
        description = Strings.type_35;
        imagePath = "";
        break;
      case "type_36":
        description = Strings.type_36;
        imagePath = "";
        break;
      case "type_37":
        description = Strings.type_37;
        imagePath = "";
        break;
      case "type_38":
        description = Strings.type_38;
        imagePath = "";
        break;
      case "type_39":
        description = Strings.type_39;
        imagePath = "";
        break;
      case "type_40":
        description = Strings.type_40;
        imagePath = "";
        break;
      case "type_41":
        description = Strings.type_41;
        imagePath = "";
        break;
      case "type_42":
        description = Strings.type_42;
        imagePath = "";
        break;
      case "type_43":
        description = Strings.type_43;
        imagePath = "";
        break;
      default:
        description = Strings.typeUndefined;
        imagePath = "";
    }
    return Condition._(type, description, imagePath);
  }

  @override
  String toString() {
    return "Condition: $typeId, $description, $imagePath";
  }
}
