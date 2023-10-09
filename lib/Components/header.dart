import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class WeatherHeader extends StatefulWidget {
  const WeatherHeader({
    super.key,
    required this.scroll,
    required this.weather,
  });

  final ScrollController scroll;

  final WeatherModel weather;

  @override
  State<WeatherHeader> createState() => WeatherHeaderState();
}

class WeatherHeaderState extends State<WeatherHeader> {
  bool scrolldown = false;

  @override
  void initState() {
    super.initState();

    //listener
    widget.scroll.addListener(() {
      if (widget.scroll.offset <= 40 && scrolldown == true) {
        setState(() {
          scrolldown = false;
        });
      }

      if (widget.scroll.offset >= 40 && scrolldown == false) {
        setState(() {
          scrolldown = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (scrolldown) {
      return Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            widget.weather.city,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 24,
            ),
          ),
          Text(
            "${widget.weather.temperature.toStringAsFixed(0)}° | ${widget.weather.weather}",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 40,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      );
    }

    return Center(
      child: Text(
        widget.weather.city,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height / 24,
        ),
      ),
    );
  }
}
