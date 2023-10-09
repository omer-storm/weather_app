List<String> getNextHours() {
  final now = DateTime.now();
  int current = now.hour;
  List<String> hours = [];
  if (current > 12) {
    for (var i = 0; i < 5; i++) {
      var value = now.hour + (3 * i);
      if (value < 24) {
        hours[i] = "${value - 12}PM";
      } else {
        if ((value - 24) != 0) {
          hours[i] = "${value - 24}AM";
        } else {
          hours[i] = "12AM";
        }
      }
    }
  } else {
    for (var i = 0; i < 5; i++) {
      var value = now.hour + (3 * i);
      if (value < 12) {
        if (value != 0) {
          hours[i] = "${value}AM";
        } else {
          hours[i] = "12AM";
        }
      } else {
        hours[i] = "$value-12PM";
      }
    }
  }

  return hours;
}
