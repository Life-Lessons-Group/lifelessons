import 'package:firebase_flutter_life/core/AppColors.dart';
import 'package:firebase_flutter_life/models/user.dart';
import 'package:firebase_flutter_life/services/firebase_auth_service.dart';
import 'package:firebase_flutter_life/services/firebase_user_data_service.dart';
import 'package:firebase_flutter_life/views/authentication/register_screen.dart.dart';
import 'package:firebase_flutter_life/views/discover/selected_category_screen.dart';
import 'package:firebase_flutter_life/views/authentication/login_screen.dart';
import 'package:firebase_flutter_life/views/authentication/walkthrough_screen.dart';
import 'package:firebase_flutter_life/views/authentication/splash_screen.dart';
import 'package:firebase_flutter_life/views/topics/topics_screen.dart';
import 'package:firebase_flutter_life/routing/route_names.dart';
import 'package:firebase_flutter_life/services/shared_prefs.dart';

import 'package:firebase_flutter_life/views/profile/screens/profile_screen.dart';
import 'package:firebase_flutter_life/views/record/record_begin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';


import 'views/topics/archived_topic_screen.dart';
import 'views/discover/selected_book_screen.dart';
import 'views/home/home_screen.dart';

import 'providers/topics.dart';
import 'routing/router.dart';
import 'services/locator_service.dart';
import 'views/profile/screens/user_profile_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await sharedPrefs.init();
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
        ChangeNotifierProvider(create: (ctx) => UserDatabaseService()),
      ],
      child: OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: AppColors.accessoryColor),
          
          initialRoute: SplashRoute,
          onGenerateRoute: generateRoute,
          routes: {
            HomeRoute: (context) => HomeScreen(),
            TopicsRoute: (context) => TopicsScreen(),
            RecordRoute: (context) => RecordBeginScreen(),
            UserProfileRoute: (context) => UserProfileScreen(),
            ProfileRoute: (context) => ProfileScreen(),
            LoginRoute: (context) => LoginScreen(),
            RegisterRoute: (context) => RegisterScreen(),
            ArchiveRoute: (context) => ArchivedTopicsScreen(),
            WalkThroughRoute: (context) => WalkthroughScreen(),
            SplashRoute: (context) => SplashScreen(),
            CategoryRoute: (context) => CategoryScreen(),
            BookRoute: (context) => BookScreen(),
          },
        ),
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
