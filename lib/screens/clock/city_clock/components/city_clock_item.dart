import 'package:flutter/material.dart';

class CityClockItem extends StatefulWidget {
  final int itemIndex;
  const CityClockItem({Key? key, required this.itemIndex}) : super(key: key);

  @override
  _CityClockItemState createState() => _CityClockItemState();
}

class _CityClockItemState extends State<CityClockItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          '${DateTime.now().timeZoneName}, ${DateTime.now().timeZoneOffset}'),
    );
  }
}
