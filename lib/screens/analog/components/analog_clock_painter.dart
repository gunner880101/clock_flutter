import 'dart:math';

import 'package:clock_flutter/constants.dart';
import 'package:clock_flutter/utils/common_utils.dart';
import 'package:flutter/material.dart';

class AnalogClockPainter extends CustomPainter {
  final degreeOffset = -90.0;

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    /// Outline of clock
    var fillBrush = Paint()..color = clockBackgroundColor;
    var outlineBrush = Paint()
      ..color = clockForegroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;

    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);

    /// min&sec points
    var dashBrush = Paint()
      ..color = clockForegroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    var dashBoldBrush = Paint()
      ..color = clockForegroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    var outerRadius = radius * 0.8;
    var innerRadius = radius * 0.68;
    var boldRadius = radius * 0.65;
    for (var angle = 0; angle < 360; angle += 6) {
      var x1 =
          centerX + outerRadius * cos(degreeToRadian(angle + degreeOffset));
      var y1 =
          centerY + outerRadius * sin(degreeToRadian(angle + degreeOffset));

      var radius = angle % 30 == 0 ? boldRadius : innerRadius;
      var x2 = centerX + radius * cos(degreeToRadian(angle + degreeOffset));
      var y2 = centerY + radius * sin(degreeToRadian(angle + degreeOffset));
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2),
          angle % 30 == 0 ? dashBoldBrush : dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
