import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../common/services/rewarded_add.dart';

class TimerView extends StatefulWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 600;
  int currentSeconds = 600;
  bool shown  = false;
  Timer? _timer;

  String get timer => '${(currentSeconds ~/ 60).toString().padLeft(2, '0')} : ${(currentSeconds % 60).toString().padLeft(2, '0')}';

  void startTimeout() {
    currentSeconds = 60;
    final duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      currentSeconds = timerMaxSeconds - timer.tick;
      if (timer.tick >= timerMaxSeconds) {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(timer.toString(), style: const TextStyle(fontSize: 16),);
  }
}
