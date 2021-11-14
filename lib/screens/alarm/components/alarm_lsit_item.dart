import 'package:clock_flutter/constants.dart';
import 'package:flutter/material.dart';

class AlarmListItem extends StatefulWidget {
  final int itemIndex;
  const AlarmListItem({Key? key, required this.itemIndex}) : super(key: key);

  @override
  _AlarmListItemState createState() => _AlarmListItemState();
}

class _AlarmListItemState extends State<AlarmListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: ListTile(
        title: Text(alarms[widget.itemIndex].dateTime!.toString()),
        subtitle: Text(alarms[widget.itemIndex].note!),
        leading: Switch(
          value: alarms[widget.itemIndex].active!,
          onChanged: (bool value) {},
        ),
      ),
    );
  }
}
