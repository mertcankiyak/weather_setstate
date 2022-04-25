import 'package:weather_setstate/features/weather/model/weather_model.dart';
import 'package:weather_setstate/product/enum/LocationEnum.dart';

abstract class IWeatherService {
  Future<Weather?> fetchWeather({LocationName? locationName});
}
