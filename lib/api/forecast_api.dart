import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/models/forecast_model.dart';

import 'exceptions.dart';

dynamic client;

Future<List<ForecastModel>> fetchForecast(context, city) async {
  bool result = await InternetConnectionChecker().hasConnection;
  try {
    if (result) {
      client = http.Client();
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        // client.close();
        return jsonResponse["list"]
            .map<ForecastModel>((data) => ForecastModel.fromJson(data))
            .toList();
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
    print(error);
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
