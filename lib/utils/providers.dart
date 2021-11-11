import 'package:flutter/material.dart';

class ClockRefreshNotifier with ChangeNotifier {
  bool _shouldNotify = false;

  void notifyUpdate({shouldNotify = false}) {
    if (_shouldNotify) {
      notifyListeners();
    }
  }
}
