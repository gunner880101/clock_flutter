import 'package:clock_flutter/screens/clock/analog/components/analog_clock_hand_painter.dart';
import 'package:clock_flutter/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalogClockHands extends StatefulWidget {
  final double size;
  const AnalogClockHands({Key? key, required this.size}) : super(key: key);

  @override
  _AnalogClockHandsState createState() => _AnalogClockHandsState();
}

class _AnalogClockHandsState extends State<AnalogClockHands> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClockRefreshNotifier>(
      builder: (context, provider, _) {
        return Container(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: AnalogClockHandPainter(),
          ),
        );
      },
    );
  }
}
