import 'package:flutter/material.dart';
import '../api/cities_api.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({super.key, required this.setCountry});

  final Function setCountry;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchCountries(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return Card(
              child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.05,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(snapshot.data![index]),
                        onTap: () {
                          setCountry(snapshot.data![index]);
                        },
                      );
                    }),
              )
            ],
          ));
        }

        return const Text("Some Error");
      },
    );
  }
}
