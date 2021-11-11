import 'package:clock_flutter/screens/analog/components/analog_clock_painter.dart';
import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

class ClockBackground extends StatelessWidget {
  final double? clockSize;
  const ClockBackground({Key? key, this.clockSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size =
        clockSize ?? (SizeConfig.screenWidth! - SizeConfig().getHeight(50.0));
    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: AnalogClockPainter(),
      ),
    );
  }
}
