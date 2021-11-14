import 'package:clock_flutter/models/alarm_info.dart';
import 'package:clock_flutter/utils/common_utils.dart';
import 'package:clock_flutter/utils/dialogs.dart';
import 'package:flutter/material.dart';

class AlarmListItem extends StatefulWidget {
  final int itemIndex;
  final AlarmInfo alarmInfo;
  final Function onRemoveAlarm;
  final Function onUpdateActive;
  const AlarmListItem(
      {Key? key,
      required this.itemIndex,
      required this.alarmInfo,
      required this.onRemoveAlarm,
      required this.onUpdateActive})
      : super(key: key);

  @override
  _AlarmListItemState createState() => _AlarmListItemState();
}

class _AlarmListItemState extends State<AlarmListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: GestureDetector(
        onLongPress: () {
          showRemoveAlarmConfirmDialog(context, onAgreed: () {
            print('alarm removed');
            widget.onRemoveAlarm(widget.alarmInfo);
          });
        },
        child: ListTile(
          title: Text(getAlarmTimeString(widget.alarmInfo.dateTime!)),
          subtitle: Text(widget.alarmInfo.note!),
          leading: Switch(
            value: widget.alarmInfo.active == 1,
            onChanged: (bool value) {
              widget.onUpdateActive(id: widget.alarmInfo.id, active: value);
            },
          ),
        ),
      ),
    );
  }
}
