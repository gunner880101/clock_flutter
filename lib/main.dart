import 'package:clock_flutter/screens/main_screen.dart';
import 'package:clock_flutter/utils/orientation_util.dart';
import 'package:clock_flutter/utils/providers.dart';
import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ClockRefreshNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: setVerticalOrientations(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              SizeConfig().init(context);
              return MainScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
