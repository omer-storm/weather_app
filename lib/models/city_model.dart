class CityModel {
  final String name;
  final num lon;
  final num lat;
  final String country;

  const CityModel({
    required this.name,
    required this.lon,
    required this.lat,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        name: json["name"],
        lon: json["lon"],
        lat: json["lat"],
        country: json["country"]);
  }

  contains(String lowerCase) {}
}
