import 'package:flutter/material.dart';
import 'package:weather_setstate/features/weather/model/weather_model.dart';
import 'package:weather_setstate/features/weather/service/WeatherService.dart';
import 'package:weather_setstate/product/enum/LocationEnum.dart';

class WeatherView extends StatefulWidget {
  WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final _weatherService = WeatherService();

  LocationName _locationName = LocationName.LONDON;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.indigo,
      title: Text("Weather App"),
    );
  }

  Center _buildBody() {
    return Center(
      child: Column(
        children: [
          _buildFetchWeather(),
          _cityRowButton(),
        ],
      ),
    );
  }

  FutureBuilder<Weather?> _buildFetchWeather() {
    return FutureBuilder(
      future: _weatherService.fetchWeather(locationName: _locationName),
      builder: ((BuildContext context, AsyncSnapshot<Weather?> snapshot) {
        if (snapshot.hasData) {
          return _weatherInfoCard(snapshot);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  Card _weatherInfoCard(AsyncSnapshot<Weather?> snapshot) {
    return Card(
      child: ListTile(
        title: Text((snapshot.data!.location?.country) ?? "-"),
        subtitle: Text(snapshot.data!.location?.name ?? "-"),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(snapshot.data!.current?.tempC.toString() ?? "-"),
            Text(" \u2103"),
          ],
        ),
        trailing: Text(snapshot.data!.location?.localtime ?? "-"),
      ),
    );
  }

  Row _cityRowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _istanbulWeatherButton(),
        _londonWeatherButton(),
        _ankaraWeatherButton(),
      ],
    );
  }

  ElevatedButton _istanbulWeatherButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _locationName = LocationName.ISTANBUL;
        });
      },
      child: Text("İstanbul"),
    );
  }

  ElevatedButton _londonWeatherButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _locationName = LocationName.LONDON;
        });
      },
      child: Text("Londra"),
    );
  }

  ElevatedButton _ankaraWeatherButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _locationName = LocationName.ANKARA;
        });
      },
      child: Text("Ankara"),
    );
  }
}
