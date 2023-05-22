// ignore_for_file: avoid_print

import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'dart:convert';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.weatherData});
  final dynamic weatherData;

  @override
  // ignore: library_private_types_in_public_api
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late dynamic temp;
  late dynamic condition;
  late dynamic cityName;

  @override
  void initState() {
    super.initState();

    String jsonData = widget.weatherData;
    Map<String, dynamic> data = jsonDecode(jsonData);

    print(data);
    updateUi(data);
  }

  void updateUi(weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        condition = 1000;
        cityName = "error";
      }
    });
    temp = weatherData['main']['temp'].round();
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];

    print(temp);
    print(condition);
    print(cityName);
  }

  WeatherModel weatherModelData = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _showExitDialog(context),
      child: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: const NetworkImage(
          //         'https://raw.githubusercontent.com/londonappbrewery/Clima-Flutter/master/images/location_background.jpg'),
          //     fit: BoxFit.cover,
          //     colorFilter: ColorFilter.mode(
          //         Colors.white.withOpacity(0.8), BlendMode.dstATop),
          //   ),
          // ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange[200]!,
                Colors.orange[400]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () async {
                          String jsonData =
                              await weatherModelData.getLocaitonWeather();

                          Map<String, dynamic> data = jsonDecode(jsonData);
                          updateUi(data);
                        },
                        child: const Icon(
                          Icons.near_me,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                      Text(
                        cityName,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          var cityName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CityScreen()));

                          print("i'm here");
                          if (cityName != null) {
                            String jsonData =
                                await weatherModelData.getCityWeather(cityName);
                            Map<String, dynamic> data = jsonDecode(jsonData);

                            updateUi(data);
                          }
                        },
                        child: const Icon(
                          Icons.location_city,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${temp.round()}°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherModelData.getWeatherIcon(condition),
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    "${weatherModelData.getMessage(temp)} in $cityName!",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> _showExitDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Exit'),
        content: const Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
