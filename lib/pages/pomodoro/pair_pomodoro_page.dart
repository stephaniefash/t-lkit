import 'package:flutter/material.dart';
import 'package:tulkit/constants/app_colors.dart';
import 'package:tulkit/constants/styles.dart';
import 'package:tulkit/pages/pomodoro/pair_pomodoro_timer.dart';

class PairPomodoroPage extends StatefulWidget {
  @override
  _PairPomodoroPageState createState() => _PairPomodoroPageState();
}

class _PairPomodoroPageState extends State<PairPomodoroPage> {
  @override
  Widget build(BuildContext context) {

    int timeInSeconds = 73;

    return Material(
      child: Container(
        color: AppColors.darkBlue,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PairPomodoroTimerCircleAnimation(timeInSeconds, 500),
              SizedBox(height: 80),
              Text(
                'Focus for $timeInSeconds seconds',
                style: kCountdownSubtextStyle.copyWith(fontSize: 20, letterSpacing: 2),
              )
            ]),
      ),
    );
  }
}
