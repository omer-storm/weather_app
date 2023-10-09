import 'package:flutter/material.dart';

import '../models/weather_model.dart';

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

// Widget weather(context, weather) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Text(
//         weather.city,
//         style: TextStyle(
//           fontSize: MediaQuery.of(context).size.height / 24,
//         ),
//       ),
//       Text(
//         "${weather.temperature.toStringAsFixed(0)}°",
//         style: TextStyle(fontSize: MediaQuery.of(context).size.height / 12),
//       ),
//       Padding(
//         padding: const EdgeInsetsDirectional.symmetric(vertical: 0),
//         child: Text(capitalize(weather.description),
//             style:
//                 TextStyle(fontSize: MediaQuery.of(context).size.height / 30)),
//       ),
//       Text(
//           "H:${weather.lat.toStringAsFixed(0)}°  L:${weather.lon.toStringAsFixed(0)}°",
//           style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40))
//     ],
//   );
// }

class Weather extends StatefulWidget {
  const Weather({
    super.key,
    required this.scroll,
    required this.weather,
  });

  final ScrollController scroll;

  final WeatherModel weather;

  @override
  State<Weather> createState() => WeatherState();
}

class WeatherState extends State<Weather> {
  bool fade = false, fade1 = false, fade2 = false;

  @override
  void initState() {
    super.initState();

    //listener
    widget.scroll.addListener(() {
      if (widget.scroll.offset <= 1 && fade == true) {
        setState(() {
          fade = false;
        });
      }

      if (widget.scroll.offset >= 1 && fade == false) {
        setState(() {
          fade = true;
        });
      }

      if (widget.scroll.offset <= 20 && fade1 == true) {
        setState(() {
          fade1 = false;
        });
      }

      if (widget.scroll.offset >= 20 && fade1 == false) {
        setState(() {
          fade1 = true;
        });
      }

      if (widget.scroll.offset <= 40 && fade2 == true) {
        setState(() {
          fade2 = false;
        });
      }

      if (widget.scroll.offset >= 40 && fade2 == false) {
        setState(() {
          fade2 = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 16,
          ),
          AnimatedOpacity(
              opacity: fade2 ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: Text(
                "${widget.weather.temperature.toStringAsFixed(0)}°",
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width / 6),
              )),
          AnimatedOpacity(
              opacity: fade1 ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 0),
                child: Text(capitalize(widget.weather.description),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30)),
              )),
          AnimatedOpacity(
              opacity: fade ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: Text(
                  "H:${widget.weather.lat.toStringAsFixed(0)}°  L:${widget.weather.lon.toStringAsFixed(0)}°",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40))),
        ],
      ),
    );
  }
}
