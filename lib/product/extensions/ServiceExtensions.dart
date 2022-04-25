import 'package:weather_setstate/product/enum/ServiceEnum.dart';

extension ServiceExtensions on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.CURRENT:
        return "/v1/current.json?key=";
    }
  }
}
