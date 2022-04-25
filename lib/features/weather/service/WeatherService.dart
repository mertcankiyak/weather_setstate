import 'package:flutter/material.dart';
import 'package:weather_setstate/features/weather/model/weather_model.dart';
import 'package:weather_setstate/features/weather/service/IWeatherService.dart';
import 'package:vexana/vexana.dart';
import 'package:weather_setstate/product/constants/AppConstants.dart';
import 'package:weather_setstate/product/enum/LocationEnum.dart';
import 'package:weather_setstate/product/enum/ServiceEnum.dart';
import 'package:weather_setstate/product/extensions/LocationExtensions.dart';
import 'package:weather_setstate/product/extensions/ServiceExtensions.dart';

class WeatherService extends IWeatherService {
  static final WeatherService _weatherService = WeatherService._instance();

  WeatherService._instance();

  factory WeatherService() {
    return _weatherService;
  }

  final NetworkManager _networkManager = NetworkManager(
      options: BaseOptions(baseUrl: "https://api.weatherapi.com"));

  @override
  Future<Weather?> fetchWeather({LocationName? locationName}) async {
    try {
      final response = await _networkManager.send<Weather, Weather>(
          ServicePath.CURRENT.rawValue +
              apiKey +
              "&q=" +
              locationName!.rawValue,
          parseModel: Weather(),
          method: RequestType.GET);
      return response.data;
    } catch (e) {
      //Error
    }
  }
}
