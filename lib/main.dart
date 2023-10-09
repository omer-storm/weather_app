import 'package:flutter/material.dart';
import 'package:weather_app/Components/weather_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: newTextTheme,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const WeatherSection(),
    );
  }
}
