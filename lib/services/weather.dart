// ignore_for_file: avoid_print

import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

class WeatherModel {
  String apiKey = "1537c556ea2fdee3b53f5a0092248f65";

  Future<String> getCityWeather(String cityName) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    NetworkHelper network = NetworkHelper(url);
    dynamic data = await network.getData();

    return data;
  }

  Future<String> getLocaitonWeather() async {
    dynamic data;
    Location loc = Location();
    await loc.getCurrentLocation();
    if (loc.hasLocation) {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');

      NetworkHelper network = NetworkHelper(url);
      data = await network.getData();

      return data;
    } else {
      print('Unable to retrieve location data');
      return 'nothing';
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
