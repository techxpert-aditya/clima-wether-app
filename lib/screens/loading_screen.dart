// ignore_for_file: avoid_print
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';

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

  void checkLocationPermission() async {
    PermissionStatus status = await Permission.location.status;

    if (status.isGranted) {
      // Location permission already granted, proceed with getting the weather data
      getLocation();
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Location permission denied or permanently denied, request the permission again
      requestLocationPermission();
    }
  }

  void requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      // Location permission granted, proceed with getting the weather data
      getLocation();
    } else if (status.isPermanentlyDenied) {
      // Location permission permanently denied, show a custom message and guide the user to the app settings
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Location Permission Required'),
            content: const Text(
              'This app requires access to your device\'s location to fetch weather data. '
              'Please grant location permissions in the device settings.',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Open Settings'),
                onPressed: () {
                  // Open the app settings page
                  openAppSettings();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    checkLocationPermission();
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
