import 'package:clock_flutter/screens/clock/analog/components/analog_clock_hands.dart';
import 'package:clock_flutter/screens/clock/analog/components/analog_clock_painter.dart';
import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

class AnalogClock extends StatefulWidget {
  final double? clockSize;
  const AnalogClock({Key? key, this.clockSize}) : super(key: key);

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  @override
  Widget build(BuildContext context) {
    var size = widget.clockSize ??
        (SizeConfig.screenWidth! - SizeConfig().getHeight(50.0));
    return Container(
      width: size,
      height: size,
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            child: CustomPaint(
              painter: AnalogClockPainter(),
            ),
          ),
          AnalogClockHands(size: size),
        ],
      ),
    );
  }
}
