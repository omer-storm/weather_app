class ForecastModel {
  final num temperature;
  final String main;
  final String description;
  final String icon;
  final String date;
  final String time;
  final num feelslike;

  const ForecastModel({
    required this.temperature,
    required this.main,
    required this.description,
    required this.icon,
    required this.date,
    required this.time,
    required this.feelslike,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
        temperature: json["main"]["temp"] - 273,
        main: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        icon: json["weather"][0]["icon"],
        date: json["dt_txt"].split(" ")[0],
        time: json["dt_txt"].split(" ")[1],
        feelslike: json["main"]["feels_like"] - 273);
  }

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'main': main,
      'description': description,
      'icon': icon,
      'date': date,
      'time': time,
      'feelslike': feelslike,
    };
  }
}
