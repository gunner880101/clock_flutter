import 'package:clock_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';

void showAlarmAddDialog(BuildContext context, {Function? onSaved}) {
  showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: AlarmAddDialog(onSaved: onSaved));
      });
}

class AlarmAddDialog extends StatefulWidget {
  final Function? onSaved;
  const AlarmAddDialog({Key? key, this.onSaved}) : super(key: key);

  @override
  _AlarmAddDialogState createState() => _AlarmAddDialogState();
}

class _AlarmAddDialogState extends State<AlarmAddDialog> {
  String? _note;

  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay? _picked;

  Future<Null> selectTime(BuildContext context) async {
    _picked = await showTimePicker(context: context, initialTime: _time);
    if (_picked != null && _picked != _time) {
      setState(() {
        _time = _picked!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: SizeConfig().getHeight(300.0),
        height: SizeConfig().getHeight(300.0),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(SizeConfig().getHeight(8.0)),
              child: Text(
                'Add an alarm!',
                style: TextStyle(
                  fontSize: SizeConfig().getHeight(20.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig().getHeight(8.0)),
              child: GestureDetector(
                onTap: () {
                  selectTime(context);
                },
                child: Text(
                  '${_time.hour} : ${_time.minute}',
                  style: TextStyle(fontSize: SizeConfig().getHeight(48.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig().getHeight(8.0)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Input a description',
                  hintStyle: TextStyle(color: Colors.black26),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig().getHeight(2)),
                    borderSide: BorderSide(
                        color: Colors.black26,
                        width: SizeConfig().getHeight(1)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig().getHeight(2)),
                    borderSide: BorderSide(
                        color: Colors.black26.withOpacity(0.4),
                        width: SizeConfig().getHeight(1)),
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    _note = text;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig().getHeight(8.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Dismiss',
                      style: TextStyle(fontSize: SizeConfig().getHeight(20.0)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onSaved!(note: _note, time: _time);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: SizeConfig().getHeight(20.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
