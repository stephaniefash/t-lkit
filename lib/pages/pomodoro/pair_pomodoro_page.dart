import 'package:flutter/material.dart';
import 'package:tulkit/constants/app_colors.dart';
import 'package:tulkit/pages/pomodoro/pair_pomodoro_timer.dart';

class PairPomodoroPage extends StatefulWidget {
  @override
  _PairPomodoroPageState createState() => _PairPomodoroPageState();
}

class _PairPomodoroPageState extends State<PairPomodoroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PairPomodoroTimerCircleAnimation(),
    );
  }
}
