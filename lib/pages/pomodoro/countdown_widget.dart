import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tulkit/constants/styles.dart';

class CountdownWidget extends StatefulWidget {
  final int startingTimeInSeconds;

  CountdownWidget(this.startingTimeInSeconds);

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int totalCountdownTimeInSeconds;
  int secondsLeft;
  int minutesLeft;

  @override
  void initState() {
    _setStartingTimeInMinutesAndSeconds();
    _startCountdown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(text: _formattedValue(minutesLeft), children: [
          TextSpan(text: ':'),
          TextSpan(text: _formattedValue(secondsLeft))
        ]),
        style: kCountdownStyle,
      ),
    );
  }

  _setStartingTimeInMinutesAndSeconds() {
    setState(() {
      secondsLeft = widget.startingTimeInSeconds % 60;
      minutesLeft = (widget.startingTimeInSeconds / 60).floor();
    });
  }

  _startCountdown() {
    new Stream.periodic( Duration(seconds: 1))
        .take(widget.startingTimeInSeconds)
        .listen((v) => {_evaluateSeconds()});
  }

  String _formattedValue(int time) {
    return time < 10 ? '0$time' : time.toString();
  }

  _evaluateSeconds() {
    if (secondsLeft == 0 && minutesLeft == 0) return;
    if (secondsLeft == 0 && minutesLeft != 0) {
      _reduceMinutes();
      _updateSecondsLeft(59);
    } else {
      _updateSecondsLeft(secondsLeft - 1);
    }
  }

  _updateSecondsLeft(int newTime) {
    setState(() {
      secondsLeft = newTime;
    });
  }

  _reduceMinutes() {
    setState(() {
      minutesLeft--;
    });
  }
}
