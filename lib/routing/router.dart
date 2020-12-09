import 'package:firebase_flutter_life/UI/screens/profile_screens/profile_screen.dart';
import 'package:firebase_flutter_life/UI/screens/record_screens/record_begin_screen.dart';
import 'package:firebase_flutter_life/features/archived/presentation/pages/archived_topic_screen.dart';

import 'package:firebase_flutter_life/features/home/presentation/pages/home_screen.dart';
import 'package:firebase_flutter_life/features/login/presentation/pages/login_screen.dart';
import 'package:firebase_flutter_life/features/onboarding_walkthrough/presentation/pages/walkthrough_screen.dart';
import 'package:firebase_flutter_life/features/register/presentation/pages/register_screen.dart.dart';
import 'package:firebase_flutter_life/features/splash/presentation/pages/splash_screen.dart';
import 'package:firebase_flutter_life/features/topics/presentation/pages/topics_screen.dart';

import 'package:flutter/material.dart';

import 'route_names.dart';

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeScreen(), settings);
    case ProfileRoute:
      return _getPageRoute(ProfileScreen(), settings);
    case RecordRoute:
      return _getPageRoute(RecordBeginScreen(), settings);
    case ArchiveRoute:
      return _getPageRoute(ArchivedTopicsScreen(), settings);
    case LoginRoute:
      return _getPageRoute(LoginScreen(), settings);
    case RegisterRoute:
      return _getPageRoute(RegisterScreen(), settings);
    case TopicsRoute:
      return _getPageRoute(TopicsScreen(), settings);
    case WalkThroughRoute:
      return _getPageRoute(WalkthroughScreen(), settings);
    case SplashRoute:
      return _getPageRoute(SplashScreen(), settings);
    default:
      return _getPageRoute(WalkthroughScreen(), settings);
  }
}
