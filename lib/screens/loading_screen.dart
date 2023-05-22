// ignore_for_file: avoid_print
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    WeatherModel weatherModelData = WeatherModel();

    String data = await weatherModelData.getLocaitonWeather();

    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  weatherData: data,
                )));
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(
          255, 53, 131, 124), // Set the background color to teal
      child: const Center(
        child: SpinKitRipple(
          color: Colors.white, // Set the color of the spinner
          size: 100.0, // Set the size of the spinner
        ),
      ),
    );
  }
}
