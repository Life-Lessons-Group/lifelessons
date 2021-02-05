import 'package:firebase_flutter_life/features/archived/presentation/pages/archived_topic_screen.dart';

import 'package:firebase_flutter_life/features/home/presentation/pages/home_screen.dart';
import 'package:firebase_flutter_life/features/login/presentation/pages/login_screen.dart';
import 'package:firebase_flutter_life/features/onboarding_walkthrough/presentation/pages/walkthrough_screen.dart';
import 'package:firebase_flutter_life/features/register/presentation/pages/register_screen.dart.dart';
import 'package:firebase_flutter_life/features/splash/presentation/pages/splash_screen.dart';
import 'package:firebase_flutter_life/features/topics/presentation/pages/topics_screen.dart';

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
