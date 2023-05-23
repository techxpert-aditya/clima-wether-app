// ignore_for_file: avoid_print

import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

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

  String getWeatherConditionName(int condition) {
    if (condition < 300) {
      return 'thunderstorming';
    } else if (condition < 400) {
      return 'drizzling';
    } else if (condition < 600) {
      return 'raining';
    } else if (condition < 700) {
      return 'snowfall';
    } else if (condition < 800) {
      return 'cloudy';
    } else if (condition == 800) {
      return 'sunny';
    } else if (condition <= 804) {
      return 'clouds';
    } else {
      return 'sunny';
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'thunderstorms';
    } else if (condition < 400) {
      return 'drizzle';
    } else if (condition < 600) {
      return 'rain';
    } else if (condition < 700) {
      return 'snow';
    } else if (condition < 800) {
      return 'cloudy';
    } else if (condition == 800) {
      return 'sun';
    } else if (condition <= 804) {
      return 'cloud';
    } else {
      return 'sun';
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

  BoxDecoration getBackgroundGradient(int condition) {
    if (condition < 300) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.brown, Colors.brown.shade700],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    } else if (condition < 400) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal, Colors.teal.shade700],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    } else if (condition < 600) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.deepPurple.shade700],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    } else if (condition < 700) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.cyan, Colors.cyan.shade700],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    } else if (condition < 800) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.orange.shade700],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    } else if (condition == 800) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.lightBlueAccent.shade700],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    } else if (condition <= 804) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.blueAccent.shade700],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    } else {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.lightBlueAccent.shade700],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    }
  }
}
