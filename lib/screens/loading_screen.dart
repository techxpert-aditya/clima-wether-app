import 'package:flutter/material.dart';
import 'package:clima/location.dart';

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
      print(loc.longitude);
      print(loc.latitude);
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
    return Scaffold(
      body: Center(
        child: Container(
          height: 100.0, // set the height
          width: 100.0, // set the width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0), // make it round
          ),
          child: ElevatedButton(
            onPressed: () {
              //Get the current location
              // getLocation();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // set the button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0), // make it round
              ),
            ),
            child: const Icon(Icons.location_on, size: 40.0),
          ),
        ),
      ),
    );
  }
}
