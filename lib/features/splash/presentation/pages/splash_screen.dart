import 'dart:async';

import 'package:firebase_flutter_life/core/size_config.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_auth_service.dart';
import 'package:firebase_flutter_life/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  }
}
