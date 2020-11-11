import 'package:firebase_flutter_life/core/AppColors.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_auth_service.dart';
import 'package:firebase_flutter_life/features/login/presentation/pages/login_screen.dart';
import 'package:firebase_flutter_life/features/onboarding_walkthrough/presentation/pages/walkthrough_screen.dart';
import 'package:firebase_flutter_life/features/splash/presentation/pages/splash_screen.dart';
import 'package:firebase_flutter_life/features/timeline/presentation/providers/topics.dart';
import 'package:firebase_flutter_life/routing/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/screens/profile_screens/profile_screen.dart';
import 'UI/screens/record_screens/record_begin_screen.dart';

import 'features/archived/presentation/pages/archived_topic_screen.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'features/timeline/data/models/topic.dart';
import 'features/timeline/presentation/pages/topics_screen.dart';
import 'features/register/presentation/pages/register_screen.dart.dart';
import 'features/timeline/presentation/providers/posts.dart';
import 'routing/router.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
        ChangeNotifierProvider(create: (ctx) => Topics()),
        ChangeNotifierProvider(create: (ctx) => Posts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: AppColors.accessoryColor),
        initialRoute: SplashRoute,
        onGenerateRoute: generateRoute,
        routes: {
          HomeRoute: (context) => HomeScreen(),
          TopicsRoute: (context) => TopicsScreen(),
          RecordRoute: (context) => RecordBeginScreen(),
          ProfileRoute: (context) => ProfileScreen(),
          LoginRoute: (context) => LoginScreen(),
          RegisterRoute: (context) => RegisterScreen(),
          ArchiveRoute: (context) => ArchivedTopicsScreen(),
          WalkThroughRoute: (context) => WalkthroughScreen(),
          SplashRoute: (context) => SplashScreen(),
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
