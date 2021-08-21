import 'package:flutter/material.dart';
import 'package:galaxy_planet/screens/details_screen.dart';
import 'package:galaxy_planet/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => HomeScreen(),
        "/details_screen" : (context) => DetailsScreen(),
      },
    );
  }
}
