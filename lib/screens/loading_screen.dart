// ignore_for_file: avoid_print

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    if (loc.hasLocation) {
      String apiKey = "1537c556ea2fdee3b53f5a0092248f65";
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey');

      NetworkHelper network = NetworkHelper(url);
      var data = await network.getData();
      print(data);
    } else {
      print('Unable to retrieve location data');
    }
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
