import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.comfortaaTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white, // Set the default text color to white
                displayColor: Colors
                    .white, // Set the default text color for headline and titles to white
              ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/location': (context) => const LocationScreen(),
        '/city': (context) => const CityScreen(),
      },
    );
  }
}
