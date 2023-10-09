import 'package:flutter/material.dart';
import 'package:weather_app/Components/forecast.dart';
import 'package:weather_app/Components/forecast_column.dart';
import 'package:weather_app/Components/loader.dart';

import '../api/forecast_api.dart';
import '../models/forecast_model.dart';

Widget forecastsection(context, city) {
  return FutureBuilder<List<ForecastModel>>(
    future: fetchForecast(context, city),
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return loader();
      }

      if (snapshot.hasError) {
        return Text(snapshot.error.toString());
      }
      if (snapshot.hasData) {
        return Column(children: [
          forecast(context, snapshot.data!),
          forecastcolumn(context, snapshot.data!),
        ]);
      }

      return const Text("Some Error");
    },
  );
}
