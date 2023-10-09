import 'package:flutter/material.dart';

// List<String> generateNextSixHours() {
//   List<String> nextSixHours = [];
//   DateTime now = DateTime.now();

//   // Generate the next 6 hours in AM/PM format
//   for (int i = 1; i < 5; i++) {
//     DateTime nextHour = now.add(Duration(hours: i * 3));
//     nextSixHours.add(formatTime(nextHour));
//   }

//   return nextSixHours;
// }

String formatTime(DateTime time) {
  String amPm = time.hour >= 12 ? 'PM' : 'AM';
  int hour12 = time.hour % 12;
  hour12 = hour12 == 0 ? 12 : hour12; // Convert 0 to 12 for 12 AM/PM
  return '$hour12$amPm';
}

Widget forecast(context, forecast) {
  // List<String> nextSixHours = generateNextSixHours();

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: const Color.fromRGBO(37, 44, 51, 0.8),
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "For 12 hours",
                  )),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            (index != 0)
                                ? Text(formatTime(DateTime.parse(
                                    "${forecast[index].date} ${forecast[index].time}")))
                                : const Text(
                                    "Now",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                            Image(
                              image: NetworkImage(
                                  "http://openweathermap.org/img/w/${forecast[index].icon}.png"),
                              height: 50,
                              width: 50,
                            ),
                            Text(
                              "${forecast[index].temperature.toStringAsFixed(0)}°C",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800),
                            ),
                          ]));
                    }),
              ),
            ],
          )));
}
