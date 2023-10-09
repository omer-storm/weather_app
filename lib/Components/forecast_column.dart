import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import "package:collection/collection.dart";
import 'package:weather_app/models/forecast_model.dart';

String getDayName(int dayOfWeek) {
  switch (dayOfWeek) {
    case 1:
      return "Monday";
    case 2:
      return "Tuesday";
    case 3:
      return "Wednesday";
    case 4:
      return "Thursday";
    case 5:
      return "Friday";
    case 6:
      return "Saturday";
    case 7:
      return "Sunday";
    default:
      return "Unknown";
  }
}

// List<String> generateNextSixHours() {
//   List<String> nextSixHours = [];
//   DateTime now = DateTime.now();

//   // Generate the next 6 hours in AM/PM format
//   for (int i = 1; i <= 6; i++) {
//     DateTime nextHour = now.add(Duration(hours: i));
//     nextSixHours.add(formatTime(nextHour));
//   }

//   return nextSixHours;
// }

// String formatTime(DateTime time) {
//   String amPm = time.hour >= 12 ? 'PM' : 'AM';
//   int hour12 = time.hour % 12;
//   hour12 = hour12 == 0 ? 12 : hour12; // Convert 0 to 12 for 12 AM/PM
//   return '$hour12$amPm';
// }

Widget forecastcolumn(context, forecast) {
  // List<String> nextSixHours = generateNextSixHours();

  forecast = groupBy(forecast, (ForecastModel obj) => obj.date);

  List<ForecastModel> objects = [];
  forecast.forEach((key, value) => objects.add(value[0]));

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: const Color.fromRGBO(37, 44, 51, 0.8),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
              child: Text("Forecast for next 5 days"),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.3,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: objects.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 21,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 5,
                                child: Text(
                                  (index != 0)
                                      ? getDayName(DateTime.parse(
                                              "${objects[index].date} ${objects[index].time}")
                                          .weekday)
                                      : "Today",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              30,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Image(
                                  image: NetworkImage(
                                      "http://openweathermap.org/img/w/${objects[index].icon}.png"),
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "${objects[index].temperature.toStringAsFixed(0)}°C",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              30,
                                      color: Colors.white.withOpacity(0.4),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 5,
                                child: LinearProgressIndicator(
                                  value: objects[index].temperature /
                                      objects[index].feelslike,
                                  color: Colors.amber,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "${objects[index].feelslike.toStringAsFixed(0)}°C",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              30,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  }),
            ),
          ])));
}
