import 'package:clock_flutter/screens/analog/analog_clock.dart';
import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: AnalogClock(
          clockSize: SizeConfig().getHeight(350.0),
        ),
      ),
    );
  }
}
