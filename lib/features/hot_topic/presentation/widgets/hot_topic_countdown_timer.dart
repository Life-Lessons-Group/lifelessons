import 'package:flutter/material.dart';

class HotTopicCountDownTimer extends StatelessWidget {
  final String days;
  final String hours;
  final String minutes;
  final String seconds;

  const HotTopicCountDownTimer(
      {this.days, this.hours, this.minutes, this.seconds});

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
            Text(
              "09",
              style: countDownTextStyle,
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
            Text(
              "21",
              style: countDownTextStyle,
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
            Text(
              "39",
              style: countDownTextStyle,
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
            Text(
              "59",
              style: countDownTextStyle,
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
