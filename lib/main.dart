
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_auth_service.dart';
import 'package:firebase_flutter_life/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/screens/profile_screens/profile_screen.dart';
import 'UI/screens/record_screens/record_begin_screen.dart';
import 'UI/screens/screens.dart';
import 'features/archived/presentation/pages/archived_topic_screen.dart';
import 'features/timeline/presentation/pages/topics_screen.dart';
import 'features/register/presentation/pages/register_screen.dart.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
          HomeScreen.routeName : (context) => HomeScreen(),
          TopicsScreen.routeName: (context) => TopicsScreen(),
          RecordBeginScreen.routeName: (context) => RecordBeginScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName : (context) => RegisterScreen(),
          ArchivedTopicsScreen.routeName: (context) => ArchivedTopicsScreen(),
        },
      ),
    );
  }
}


/* TO DO:
          Follow Provider Firebase/Flutter Tut to Fix Form -> Not Validating 
          Followers/Following
          Private Posts 
          Private Followers/Following
          Cloud Messaging Through Firebase



*/