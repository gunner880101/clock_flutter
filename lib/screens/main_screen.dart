import 'package:clock_flutter/screens/alarm/alarm_screen.dart';
import 'package:clock_flutter/screens/clock/clock_screen.dart';
import 'package:clock_flutter/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<ClockRefreshNotifier>(context, listen: false).startTimer();
    });
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<ClockRefreshNotifier>(context, listen: false).stopTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ClockScreen(),
          AlarmScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: 'Clock'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms), label: 'Alarm'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
