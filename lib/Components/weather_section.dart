import 'package:flutter/material.dart';
import 'package:weather_app/Components/loader.dart';

import 'package:weather_app/screens/home_screen.dart';

import '../api/weather_api.dart';
import '../models/weather_model.dart';

class WeatherSection extends StatefulWidget {
  const WeatherSection({
    super.key,
  });

  @override
  State<WeatherSection> createState() => WeatherSectionState();
}

class WeatherSectionState extends State<WeatherSection> {
  String city = "karachi";

  setCity(cityname) {
    setState(() {
      city = cityname;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModel>(
      future: fetchWeather(context, city),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return loader();
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
                child: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(37, 44, 51, 0.8),
              foregroundColor: Colors.amber,
              onPressed: () {
                setState(() {});
              },
              child: const Text('refresh'),
            )),
          );
        }
        if (snapshot.hasData) {
          return HomePage(
            title: "Weather App",
            weather: snapshot.data!,
            setCity: setCity,
            city: city,
          );
        }

        return const Text("Some Error");
      },
    );
  }
}
