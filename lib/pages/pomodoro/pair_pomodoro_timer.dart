import 'package:flutter/material.dart';
import 'package:tulkit/constants/app_colors.dart';
import 'package:tulkit/pages/pomodoro/countdown_widget.dart';
import 'package:tulkit/pages/pomodoro/time_elapsed_indicator.dart';

class PairPomodoroTimerCircleAnimation extends StatefulWidget {
  final int durationInSeconds;
  final double size;

  PairPomodoroTimerCircleAnimation(this.durationInSeconds, this.size);

  @override
  _PairPomodoroTimerCircleAnimationState createState() =>
      _PairPomodoroTimerCircleAnimationState();
}

class _PairPomodoroTimerCircleAnimationState
    extends State<PairPomodoroTimerCircleAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: widget.durationInSeconds),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.9, curve: Curves.fastOutSlowIn),
      reverseCurve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double dimensions = 500;

    return Material(
      child: Container(
        color: AppColors.darkBlue,
        child: Stack(children: [
          Center(
            child: Container(
              width: dimensions,
              height: dimensions,
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (BuildContext context, Widget child) {
                    return TimeElapsedIndicator(
                      unElapsedLineColor: AppColors.grey,
                      value: _animation.value,
                      elapsedLineColor: Colors.redAccent,
                      strokeWidth: 4,
                    );
                  }),
            ),
          ),
          Center(
            child: Container(
                width: dimensions,
                height: dimensions,
                child: CountdownWidget(widget.durationInSeconds)),
          )
        ]),
      ),
    );
  }
}
