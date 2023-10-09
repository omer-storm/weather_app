import 'package:flutter/material.dart';
import 'package:weather_app/Components/cities_list_builder.dart';
import 'package:location/location.dart';
import 'package:weather_app/api/weather_api.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key, required this.setCity});

  final Function setCity;

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        children: [
          ListTile(
              title: const Text("Current Location"),
              onTap: () {
                getLocation(context, widget.setCity);
              }),
          ListTile(
              title: const Text("Search City"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CityListBuild(
                            setCity: widget.setCity,
                          )),
                );
              })
        ],
      ),
    ));
  }
}

getLocation(context, setCity) async {
  Location location = Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();

  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      showLocationAlert(context, "permission not granted");

      return;
    }
  }

  showLocationAlert(context, "location is loading");
  locationData = await location.getLocation();
  String city =
      await fetchName(context, locationData.latitude, locationData.longitude);
  setCity(city);
  Navigator.of(context).popUntil((route) => route.isFirst);
}

void showLocationAlert(context, message) {
  showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(message)],
              ),
            ),
          ));
}
