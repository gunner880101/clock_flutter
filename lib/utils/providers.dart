import 'dart:async';

import 'package:flutter/material.dart';

class ClockRefreshNotifier with ChangeNotifier {
  Timer? _timer;

  void startTimer() {
    /// prevent duplication of timer
    if (_timer == null || _timer!.isActive) {
      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        notifyListeners();
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
  }
}
