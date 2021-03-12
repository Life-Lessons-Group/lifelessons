import 'package:firebase_flutter_life/views/authentication/register_screen.dart.dart';
import 'package:firebase_flutter_life/views/topics/archived_topic_screen.dart';

import 'package:firebase_flutter_life/views/home/home_screen.dart';
import 'package:firebase_flutter_life/views/authentication/login_screen.dart';
import 'package:firebase_flutter_life/views/authentication/walkthrough_screen.dart';

import 'package:firebase_flutter_life/views/authentication/splash_screen.dart';
import 'package:firebase_flutter_life/views/topics/topics_screen.dart';

import 'package:firebase_flutter_life/views/profile/screens/profile_screen.dart';
import 'package:firebase_flutter_life/views/profile/screens/user_profile_screen.dart';
import 'package:firebase_flutter_life/views/record/record_begin_screen.dart';

import 'package:flutter/material.dart';

import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case ProfileRoute:
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case UserProfileRoute:
      var userProfileArgs = settings.arguments;
      return MaterialPageRoute(builder: (context) => UserProfileScreen(userID: userProfileArgs));
    case RecordRoute:
      return MaterialPageRoute(builder: (context) => RecordBeginScreen());
    case ArchiveRoute:
      return MaterialPageRoute(builder: (context) => ArchivedTopicsScreen());
    case LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case RegisterRoute:
      return MaterialPageRoute(builder: (context) => RegisterScreen());
    case TopicsRoute:
      return MaterialPageRoute(builder: (context) => TopicsScreen());
    case WalkThroughRoute:
      return MaterialPageRoute(builder: (context) => WalkthroughScreen());
    case SplashRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    default:
      return MaterialPageRoute(builder: (context) => WalkthroughScreen());
  }
}
