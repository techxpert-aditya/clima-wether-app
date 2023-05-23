// ignore_for_file: avoid_print

import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'dart:convert';
import 'package:clima/services/weather.dart';
import 'package:intl/intl.dart';

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
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    getCurrentDateTime();

    String jsonData = widget.weatherData;
    Map<String, dynamic> data = jsonDecode(jsonData);

    print(data);
    updateUi(data);
  }

  void getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE, MMMM d');
    formattedDate = formatter.format(now);

    setState(() {});
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
                Colors.blue[200]!,
                Colors.blue[400]!,
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
                Center(
                  child: Text(
                    formattedDate,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 100, right: 100, left: 100),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3), // shadow color
                          blurRadius: 100, // spread radius
                          offset:
                              const Offset(0, 4), // offset in x and y direction
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Image.network(
                            'https://raw.githubusercontent.com/techxpert-aditya/weather-icons/master/sun.png'),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${temp.round()}°',
                                style: kTempTextStyle,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  ', Sunny',
                                  style: TextStyle(
                                    fontSize: 25.00,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 50),
                  child: Center(
                    child: Text(
                      "${weatherModelData.getMessage(temp)} in $cityName!",
                      textAlign: TextAlign.center,
                      style: kMessageTextStyle,
                    ),
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
