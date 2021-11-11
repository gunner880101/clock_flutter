import 'package:clock_flutter/screens/clock/analog/analog_clock.dart';
import 'package:clock_flutter/screens/clock/city_clock/CityClocks.dart';
import 'package:clock_flutter/screens/clock/digital/digital_clock.dart';
import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = (_currentIndex + 1) % 2;
              });
            },
            child: AnimatedCrossFade(
              firstChild: AnalogClock(
                clockSize: SizeConfig().getHeight(350.0),
              ),
              secondChild: DigitalClock(
                clockSize: SizeConfig().getHeight(350.0),
              ),
              duration: Duration(milliseconds: 500),
              crossFadeState: _currentIndex == 0
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
          Expanded(
            child: CityClocks(),
          ),
        ],
      ),
    );
  }
}
