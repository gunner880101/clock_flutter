import 'dart:math';

import 'package:clock_flutter/constants.dart';
import 'package:clock_flutter/utils/common_utils.dart';
import 'package:flutter/material.dart';

class AnalogClockHandPainter extends CustomPainter {
  var dateTime = DateTime.now();
  final degreeOffset = -90.0;

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
      ..strokeCap = StrokeCap.square
      ..strokeWidth = size.width / 60;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [minuteHandColor, minuteHandColor])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [hourHandColor, hourHandColor])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    var hourHandX = centerX +
        radius *
            0.4 *
            cos(degreeToRadian(
                dateTime.hour * 30 + dateTime.minute * 0.5 + degreeOffset));
    var hourHandY = centerY +
        radius *
            0.4 *
            sin(degreeToRadian(
                dateTime.hour * 30 + dateTime.minute * 0.5 + degreeOffset));
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX +
        radius * 0.6 * cos(degreeToRadian(dateTime.minute * 6 + degreeOffset));
    var minHandY = centerY +
        radius * 0.6 * sin(degreeToRadian(dateTime.minute * 6 + degreeOffset));
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX +
        radius * 0.6 * cos(degreeToRadian(dateTime.second * 6 + degreeOffset));
    var secHandY = centerY +
        radius * 0.6 * sin(degreeToRadian(dateTime.second * 6 + degreeOffset));
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    /// Center dot
    var centerDotBrush = Paint()..color = clockForegroundColor;
    canvas.drawCircle(center, radius * 0.12, centerDotBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
