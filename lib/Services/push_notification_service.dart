import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future initialize() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      //Called when app is in the foreground
      onMessage: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    },

    //called when app has been closed
      onLaunch: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    },

    //called when app is in the background
      onResume: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    },
    );
  }
}
