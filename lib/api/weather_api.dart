import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/models/weather_model.dart';

import 'exceptions.dart';

dynamic client;

Future<WeatherModel> fetchWeather(context, city) async {
  bool result = await InternetConnectionChecker().hasConnection;
  try {
    if (result) {
      client = http.Client();
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=c7a7e62a2a92fa56f18acff2a77e5ee9');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        // client.close();

        return WeatherModel.fromJson(jsonResponse);
      } else {
        throw Exception('Unexpected error occured!');
      }
    } else {
      throw NoInternetException("No Internet Connection");
    }
  } on NoInternetException catch (error) {
    showAlertNet(context, error);
    // make it explicit that this function can throw exceptions
    rethrow;
  } catch (error) {
    // make it explicit that this function can throw exceptions
    rethrow;
  }
}

Future<String> fetchName(context, lat, long) async {
  bool result = await InternetConnectionChecker().hasConnection;

  try {
    if (result) {
      client = http.Client();
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=c7a7e62a2a92fa56f18acff2a77e5ee9');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        // client.close();
        return jsonResponse["name"];
      } else {
        throw Exception('Unexpected error occured!');
      }
    } else {
      throw NoInternetException("No Internet Connection");
    }
  } on NoInternetException catch (error) {
    showAlertNet(context, error);
    // make it explicit that this function can throw exceptions
    rethrow;
  } catch (error) {
    // make it explicit that this function can throw exceptions
    showAlertNet(context, error);
    rethrow;
  }
}

void showAlertNet(context, error) {
  showDialog(
      context: context,
      builder: (context) => const Dialog(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("No Internet Connection")],
              ),
            ),
          ));
}
