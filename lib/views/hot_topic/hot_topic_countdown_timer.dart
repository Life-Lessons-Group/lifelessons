import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HotTopicCountDownTimer extends StatefulWidget {
  final String days;
  final String hours;
  final String minutes;
  final String seconds;

  const HotTopicCountDownTimer(
      {this.days, this.hours, this.minutes, this.seconds});

  @override
  _HotTopicCountDownTimerState createState() => _HotTopicCountDownTimerState();
}

class _HotTopicCountDownTimerState extends State<HotTopicCountDownTimer> {
  Timer _timer;

  List<String> _timeUntil = List(4);

  void _startTimer() async {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeUntil =
            TimeLeft().timeLeft(DateTime.utc(2021, 04, 15, 11, 59, 59));
        print("Time Until" + _timeUntil.toString()); //timeLeft Function
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle countDownTextStyle = TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
    final TextStyle indicatorTextStyle = TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _timeUntil[0] == null ? 0 : 1.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                _timeUntil[0] ?? "",
                style: countDownTextStyle,
              ),
            ),
            Text(
              "DAYS",
              style: indicatorTextStyle,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _timeUntil[1] == null ? 0 : 1.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                _timeUntil[1] ?? "",
                style: countDownTextStyle,
              ),
            ),
            Text(
              "HOURS",
              style: indicatorTextStyle,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _timeUntil[2] == null ? 0 : 1.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                _timeUntil[2] ?? "",
                style: countDownTextStyle,
              ),
            ),
            Text(
              "MINUTES",
              style: indicatorTextStyle,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _timeUntil[3] == null ? 0 : 1.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                _timeUntil[3] ?? "",
                style: countDownTextStyle,
              ),
            ),
            Text(
              "SECONDS",
              style: indicatorTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}

class TimeLeft {
  List<String> timeLeft(DateTime due) {
    List<String> retVal;

    Duration _timeUntilDue = due.difference(DateTime.now());

    int _daysUntil = _timeUntilDue.inDays;
    int _hoursUntil = _timeUntilDue.inHours - (_daysUntil * 24);
    int _minUntil =
        _timeUntilDue.inMinutes - (_daysUntil * 24 * 60) - (_hoursUntil * 60);
    int _secondsUntil = _timeUntilDue.inSeconds -
        (_daysUntil * 24 * 60 * 60) -
        (_hoursUntil * 60 * 60) -
        (_minUntil * 60);

    if (_daysUntil > 0) {
      retVal = [
        _daysUntil.toString(),
        _hoursUntil.toString(),
        _minUntil.toString(),
        _secondsUntil.toString()
      ];
    } else if (_hoursUntil > 0) {
      retVal = [
        "0",
        _hoursUntil.toString(),
        _minUntil.toString(),
        _secondsUntil.toString()
      ];
    } else if (_minUntil > 0) {
      retVal = ["0", "0", _minUntil.toString(), _secondsUntil.toString()];
    } else if (_minUntil == 0) {
      retVal = ["0", "0", "0", _secondsUntil.toString()];
    } else {
      retVal = ["Error"];
    }

    return retVal;
  }
}
