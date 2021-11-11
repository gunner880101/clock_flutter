import 'package:clock_flutter/screens/clock_screen.dart';
import 'package:clock_flutter/utils/orientation_util.dart';
import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: setVerticalOrientations(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              SizeConfig().init(context);
              return ClockScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
