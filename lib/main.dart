import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(FlightAvailabilityApp());
}

class FlightAvailabilityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Availability',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
