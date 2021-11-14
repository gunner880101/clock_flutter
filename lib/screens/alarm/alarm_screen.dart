import 'package:clock_flutter/constants.dart';
import 'package:clock_flutter/screens/alarm/components/alarm_lsit_item.dart';
import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig().getHeight(12.0)),
            child: Text(
              'Alarm',
              style: TextStyle(fontSize: SizeConfig().getHeight(24.0)),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: alarms.length,
                  itemBuilder: (context, index) {
                    return AlarmListItem(
                      itemIndex: index,
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Add alarm!');
        },
      ),
    );
  }
}
