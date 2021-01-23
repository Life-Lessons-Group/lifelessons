import 'package:firebase_flutter_life/services/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternalNotifications {
  int listenCount = SharedPrefs().listenCount;

  contributionReminder(BuildContext context) {
    switch (listenCount) {
      case 3:
        {
          notification(context, "We're glad you're enjoying the lessons.",
              "We'd love to hear a lesson or two from you!");
        }
        break;

      case 5:
        {
          notification(context, "We still haven't heard from you?",
              "Are you against leaving a lessons this weekend?");
        }
        break;
      case 10:
        {
          notification(context, "Hey There.",
              "You haven't given up on leaving a lesson have you?");
          SharedPrefs().listenCount = 0;
        }
        break;
      default:
        {}
        break;
    }
  }

  notification(BuildContext context, String title, String text) {
    showOverlayNotification((context) {
      return SafeArea(
        child: Card(
          child: ListTile(
            title: Text(title),
            subtitle: Text(text),
          ),
        ),
      );
    }, duration: Duration(milliseconds: 2000));
  }
}
