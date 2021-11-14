import 'package:clock_flutter/models/alarm_info.dart';
import 'package:clock_flutter/screens/alarm/components/alarm_list_item.dart';
import 'package:clock_flutter/utils/db_utils.dart';
import 'package:clock_flutter/utils/dialogs.dart';
import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  AlarmManager _alarmManager = AlarmManager();
  Future<List<AlarmInfo>>? _alarmList;
  List<AlarmInfo> _curAlarmList = [];
  @override
  void initState() {
    super.initState();
    _alarmManager.initializeDatabase().then((value) {
      getAlarmData();
    });
  }

  void getAlarmData() {
    _alarmList = _alarmManager.getAlarms();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AlarmInfo>>(
      future: _alarmList,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          _curAlarmList = snapshot.data;
          print('${snapshot.data}');
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
                        itemCount: _curAlarmList.length,
                        itemBuilder: (context, index) {
                          return AlarmListItem(
                            itemIndex: index,
                            alarmInfo: _curAlarmList[index],
                            onRemoveAlarm: (info) {
                              AlarmInfo alarmInfo = info;
                              _alarmManager.delete(alarmInfo.id!).then((value) {
                                print('$value rows removed!');
                                getAlarmData();
                              });
                            },
                            onUpdateActive: ({id, active}) {
                              _alarmManager
                                  .updateAlarmActive(id, active: active)
                                  .then((value) {
                                print('$value rows updated!');
                                getAlarmData();
                              });
                            },
                          );
                        }),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showAlarmAddDialog(context, onSaved: ({note, time}) {
                  TimeOfDay tod = time;
                  var now = DateTime.now();
                  _alarmManager
                      .addAlarm(AlarmInfo(
                          active: 1,
                          note: note ?? "",
                          dateTime: DateTime(now.year, now.month, now.day,
                              tod.hour, tod.minute)))
                      .then((_) {
                    getAlarmData();
                  });
                });
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
