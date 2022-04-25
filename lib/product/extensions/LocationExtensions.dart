import 'package:weather_setstate/product/enum/LocationEnum.dart';

extension LocationExtensions on LocationName {
  String get rawValue {
    switch (this) {
      case LocationName.LONDON:
        return "London";
      case LocationName.ISTANBUL:
        return "Istanbul";
      case LocationName.ANKARA:
        return "Ankara";
      default:
        return "London";
    }
  }
}
