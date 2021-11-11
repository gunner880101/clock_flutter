import 'dart:async';

import 'package:clock_flutter/screens/analog/components/analog_clock_hand_painter.dart';
import 'package:flutter/material.dart';

class AnalogClockHands extends StatefulWidget {
  final double size;
  const AnalogClockHands({Key? key, required this.size}) : super(key: key);

  @override
  _AnalogClockHandsState createState() => _AnalogClockHandsState();
}

class _AnalogClockHandsState extends State<AnalogClockHands> {
  Timer? timer;
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: AnalogClockHandPainter(),
      ),
    );
  }
}
