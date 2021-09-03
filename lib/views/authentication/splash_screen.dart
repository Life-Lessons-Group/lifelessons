import 'dart:async';

import 'package:firebase_flutter_life/core/size_config.dart';
import 'package:firebase_flutter_life/services/firebase_auth_service.dart';
import 'package:firebase_flutter_life/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _auth = AuthService();

  startTime() async {
    var hasLoggedInUser = await _auth.isUserLoggedIn();
    if (hasLoggedInUser) {
      navigationPageHome();
      print("Home Page Navigated");
    } else {
      navigationPageLogin();
      print("Login Page Navigated");
    }
    play();
  }

  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed(HomeRoute);
  }

  void navigationPageLogin() {
    Navigator.of(context).pushReplacementNamed(LoginRoute);
  }

  void navigationPageWalkthrough() {
    Navigator.of(context).pushReplacementNamed(WalkThroughRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: <Color>[
              Colors.lightGreen[200],
              Colors.lightBlue[600],
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Life Lessons",
            style: TextStyle(
                fontWeight: FontWeight.w100, fontSize: 48, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
        _myPlayer
        .openAudioSession(
      // device: AudioDevice.blueToothA2DP,
      focus: AudioFocus.requestFocusAndStopOthers,
      category: SessionCategory.playback,
    )
        .then((value) {
      setState(() {
        _myPlayerIsInit = true;
      });
    });

  }

    @override
  void dispose() {
    // Be careful : you must `close` the audio session when you have finished with it.
    _myPlayer.closeAudioSession();
    _myPlayer = null;
    super.dispose();
  }

    void play() async {
    if (_myPlayer.isPlaying) {
      await _myPlayer.startPlayer(
          
          codec: Codec.defaultCodec,
          numChannels: 1,
          whenFinished: () {
            print("finished playing audio");
          });
    } else {
      await _myPlayer.startPlayer(
          fromURI: widget.recordingURL,
          codec: Codec.defaultCodec,
          whenFinished: () {
            print("finished playing audio");
          });
    }

    await _myPlayer.setVolume(1);
  }
}
