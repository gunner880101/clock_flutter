import 'dart:math';

import 'package:clock_flutter/constants.dart';
import 'package:clock_flutter/utils/common_utils.dart';
import 'package:flutter/material.dart';

class AnalogClockHandPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    /// Hour/Minute/Second hand
    var secHandBrush = Paint()
      ..color = secondHandColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60
      ..isAntiAlias = true;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [minuteHandColor, minuteHandColor])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30
      ..isAntiAlias = true;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [hourHandColor, hourHandColor])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24
      ..isAntiAlias = true;

    var hourAngle = dateTime.hour * 30 + dateTime.minute * 0.5 + degreeOffset;
    var hourHandX = centerX + radius * 0.4 * cos(degreeToRadian(hourAngle));
    var hourHandY = centerY + radius * 0.4 * sin(degreeToRadian(hourAngle));
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minAngle = dateTime.minute * 6 + dateTime.second * 0.1 + degreeOffset;
    var minHandX = centerX + radius * 0.6 * cos(degreeToRadian(minAngle));
    var minHandY = centerY + radius * 0.6 * sin(degreeToRadian(minAngle));
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secAngle = dateTime.second * 6 + degreeOffset;
    var secHandX = centerX + radius * 0.6 * cos(degreeToRadian(secAngle));
    var secHandY = centerY + radius * 0.6 * sin(degreeToRadian(secAngle));
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    /// Center dot
    var centerDotBrush = Paint()
      ..color = clockForegroundColor
      ..isAntiAlias = true;
    canvas.drawCircle(center, radius * 0.1, centerDotBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
