import 'dart:ui';

import 'package:clock_flutter/models/alarm_info.dart';

Color pageBackgroundColor = Color(0xFFFFFFFF);
Color clockBackgroundColor = Color(0xFFDDDDDD);
Color clockForegroundColor = Color(0xFF222222);
Color hourHandColor = Color(0xFF000000);
Color minuteHandColor = Color(0xFF111111);
Color secondHandColor = Color(0xFFFF0000);

final degreeOffset = -90.0;
final clockSize = 350.0;

List<AlarmInfo> alarms = [
  AlarmInfo(dateTime: DateTime.now(), note: "First alarm", active: true),
  AlarmInfo(dateTime: DateTime.now(), note: "Second alarm", active: false),
  AlarmInfo(dateTime: DateTime.now(), note: "Third alarm", active: false),
];
