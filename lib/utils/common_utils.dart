import 'dart:math';

import 'package:intl/intl.dart';

double degreeToRadian(double degree) {
  return degree * pi / 180;
}

String getTimeString(DateTime dateTime) {
  return DateFormat('HH:mm:ss').format(dateTime);
}

String getDateString(DateTime dateTime) {
  return DateFormat('EEE dd MMM yyyy').format(dateTime);
}
