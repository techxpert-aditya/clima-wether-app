import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    // ignore: avoid_print
    print(position);
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
              getLocation();
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
