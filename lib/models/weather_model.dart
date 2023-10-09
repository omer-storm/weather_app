class WeatherModel {
  final String city;
  final num lat;
  final num lon;
  final num temperature;
  final String icon;
  final String weather;
  final String description;

  const WeatherModel(
      {required this.city,
      required this.lat,
      required this.lon,
      required this.temperature,
      required this.icon,
      required this.weather,
      required this.description});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // print(json["coord"]["lon"]);
    return WeatherModel(
      city: json["name"],
      lat: json["coord"]["lat"],
      lon: json["coord"]["lon"],
      temperature: json["main"]["temp"] - 273,
      icon: json["weather"][0]["icon"],
      weather: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
    );
  }
}
