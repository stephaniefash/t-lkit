import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final int startingTimeInSeconds;

  CountdownWidget(this.startingTimeInSeconds);

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int totalCountdownTimeInSeconds;
  int currentSeconds;
  int currentMinutes;

  @override
  void initState() {
    _setStartingSecondsAndMinutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(text: _formattedValue(currentMinutes), children: [
          TextSpan(text: ':'),
          TextSpan(text: _formattedValue(currentSeconds))
        ]),
      ),
    );
  }

  _setStartingSecondsAndMinutes() {
    totalCountdownTimeInSeconds = widget.startingTimeInSeconds;
    setState(() {
      currentSeconds = (totalCountdownTimeInSeconds % 60);
      currentMinutes = (totalCountdownTimeInSeconds / 60).floor();
    });
  }

  String _formattedValue(int time) {
    return time < 10 ? '0$time' : time.toString();
  }
}
