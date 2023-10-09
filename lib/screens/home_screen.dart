import 'package:flutter/material.dart';
import 'package:weather_app/Components/forecast_section.dart';
import 'package:weather_app/Components/header.dart';
import 'package:weather_app/models/weather_model.dart';
import '../Components/weather.dart';
import '../utils/get_weather_image.dart';
import 'cities_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.title,
      required this.weather,
      required this.setCity,
      required this.city});

  final String title;

  final WeatherModel weather;

  final Function setCity;

  final String city;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(getWeatherImage(widget.weather.weather)),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Expanded(
              child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        title: WeatherHeader(
                          scroll: _scrollController,
                          weather: widget.weather,
                        ),
                        pinned: true,
                        expandedHeight: MediaQuery.of(context).size.height / 12,
                        backgroundColor: Colors.transparent,
                        forceElevated: false,
                      ),
                    ];
                  },
                  body: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Weather(
                          weather: widget.weather, scroll: _scrollController),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 16,
                      ),
                      forecastsection(context, widget.city),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      )
                    ],
                  )),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CityPage(
                            setCity: widget.setCity,
                          )),
                );
              },
              child: const Icon(
                Icons.menu,
                color: Colors.amber,
                size: 40,
              ),
            ),
          ])),
    );
  }
}
