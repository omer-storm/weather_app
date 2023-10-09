import 'package:flutter/material.dart';
import 'package:weather_app/Components/cities_list.dart';

import '../api/cities_api.dart';
import '../models/city_model.dart';
// import 'package:weather_app/Components/countries_list.dart';

class CityListBuild extends StatefulWidget {
  const CityListBuild({super.key, required this.setCity});

  final Function setCity;

  @override
  State<CityListBuild> createState() => _CityListBuildState();
}

class _CityListBuildState extends State<CityListBuild> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CityModel>>(
      future: fetchCities(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return CitiesList(cities: snapshot.data!, setCity: widget.setCity);
        }

        return const Text("Some Error");
      },
    );
  }
}
