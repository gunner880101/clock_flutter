import 'package:clock_flutter/screens/clock/city_clock/components/city_clock_item.dart';
import 'package:flutter/material.dart';

class CityClocks extends StatefulWidget {
  const CityClocks({Key? key}) : super(key: key);

  @override
  _CityClocksState createState() => _CityClocksState();
}

class _CityClocksState extends State<CityClocks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return CityClockItem(
              itemIndex: index,
            );
          }),
    );
  }
}
