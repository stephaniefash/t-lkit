import 'package:flutter/material.dart';
import 'package:tulkit/pages/pomodoro/time_elapsed_indicator.dart';

class PairPomodoro extends StatefulWidget {
  @override
  _PairPomodoroState createState() => _PairPomodoroState();
}

class _PairPomodoroState extends State<PairPomodoro>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.9, curve: Curves.fastOutSlowIn),
      reverseCurve: Curves.fastOutSlowIn,
    )..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        } else if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget child) {
            return TimeElapsedIndicator(
                backgroundColor: Colors.black, value: _animation.value);
          }),
    );
  }
}
