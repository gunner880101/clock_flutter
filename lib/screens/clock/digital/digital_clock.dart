import 'package:clock_flutter/utils/common_utils.dart';
import 'package:clock_flutter/utils/providers.dart';
import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DigitalClock extends StatefulWidget {
  final double? clockSize;
  const DigitalClock({Key? key, this.clockSize}) : super(key: key);

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.clockSize,
      height: widget.clockSize,
      child: Consumer<ClockRefreshNotifier>(
        builder: (context, provider, _) {
          var now = DateTime.now();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                getTimeString(now),
                style: TextStyle(
                    fontSize: SizeConfig().getHeight(64.0),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeConfig().getHeight(8.0),
              ),
              Text(
                getDateString(now),
                style: TextStyle(
                    fontSize: SizeConfig().getHeight(32.0),
                    fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }
}
