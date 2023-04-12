// ignore_for_file: avoid_print
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
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
    dynamic data;
    Location loc = Location();
    await loc.getCurrentLocation();
    if (loc.hasLocation) {
      String apiKey = "1537c556ea2fdee3b53f5a0092248f65";
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');

      NetworkHelper network = NetworkHelper(url);
      data = await network.getData();
    } else {
      print('Unable to retrieve location data');
    }

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
    return const Center(
      child: SpinKitRipple(
        color: Colors.white, // set the color of the spinner
        size: 100.0, // set the size of the spinner
      ),
    );
  }
}
