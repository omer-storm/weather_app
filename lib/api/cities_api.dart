// ignore_for_file: depend_on_referenced_packages

import 'package:weather_app/models/city_model.dart';
import 'package:flutter/services.dart';
import "package:collection/collection.dart";
import 'dart:convert';

// Fetch content from the json file
Future<List<String>> fetchCountries() async {
  final String response =
      await rootBundle.loadString('assets/cities_list.json');
  List jsonResponse = await json.decode(response);
  List<CityModel> list =
      jsonResponse.map((data) => CityModel.fromJson(data)).toList();
  list.sort((a, b) => a.country.compareTo(b.country));

  var newMap = groupBy(list, (obj) => obj.country);

  var countries = newMap.keys.toList();

  return countries;
}

// // Fetch content from the json file
// Future<List<CityModel>> fetchCities(country) async {
//   final String response =
//       await rootBundle.loadString('assets/cities_list.json');
//   List jsonResponse = await json.decode(response);
//   List<CityModel> list = jsonResponse
//       .map((data) => CityModel.fromJson(data))
//       .where((c) => c.country == country)
//       .toList();

//   return list;
// }

// Fetch content from the json file
Future<List<CityModel>> fetchCities() async {
  final String response =
      await rootBundle.loadString('assets/cities_list.json');
  List jsonResponse = await json.decode(response);
  List<CityModel> list =
      jsonResponse.map((data) => CityModel.fromJson(data)).toList();
  list.sort((a, b) => a.name.compareTo(b.name));

  return list;
}
