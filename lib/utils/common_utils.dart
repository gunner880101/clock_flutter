import 'dart:math';

double degreeToRadian(double degree) {
  return degree * pi / 180;
}

String getTimeString(DateTime dateTime) {
  return dateTime.toIso8601String().substring(11, 19);
}

String getDateString(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}
