import 'package:eslami_app/home/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Homescreen.screenRoute,
      routes: {Homescreen.screenRoute: (context) => Homescreen()},
    );
  }
}
