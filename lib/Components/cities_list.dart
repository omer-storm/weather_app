import 'package:flutter/material.dart';
import '../models/city_model.dart';

class CitiesList extends StatefulWidget {
  const CitiesList({super.key, required this.cities, required this.setCity});

  final List<CityModel> cities;
  final Function setCity;

  @override
  CitiesListState createState() => CitiesListState();
}

class CitiesListState extends State<CitiesList> {
  TextEditingController searchController = TextEditingController();

  List<CityModel> filteredcities = [];

  @override
  void initState() {
    super.initState();
    filteredcities = widget.cities;
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredcities = widget.cities
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 16,
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
            controller: searchController,
            decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.23,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: filteredcities.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(filteredcities[index].name),
                    onTap: () {
                      widget.setCity(filteredcities[index].name.toLowerCase());
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    });
              }),
        )
      ],
    ));
  }
}
