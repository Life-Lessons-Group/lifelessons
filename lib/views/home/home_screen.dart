
import 'package:firebase_flutter_life/models/user.dart';
import 'package:firebase_flutter_life/services/firebase_user_data_service.dart';
import 'package:firebase_flutter_life/views/discover/discover_screen.dart';
import 'package:firebase_flutter_life/views/hot_topic/hot_topic_screen.dart';

import 'package:firebase_flutter_life/views/topics/topics_screen.dart';
import 'package:firebase_flutter_life/views/profile/screens/profile_screen.dart';

import 'package:firebase_flutter_life/views/record/record_begin_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcase_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int pageIndex = 0;

  final bookKey = GlobalKey();
  final lessonKey = GlobalKey();
  final recordKey = GlobalKey();
  final discoverKey = GlobalKey();
  final profileKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    pageController = PageController();
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg) {
      print(msg);
      return;
    }, onLaunch: (msg) {
      print(msg);
      return;
    }, onResume: (msg) {
      print(msg);
      return;
    });

    // WidgetsBinding.instance.addPostFrameCallback((_) =>
    //     ShowCaseWidget.of(context).startShowCase(
    //         [bookKey, lessonKey]));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.jumpToPage(
      pageIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return ShowCaseWidget(
        builder: Builder(
            builder: (_) => StreamBuilder<User>(
                stream: UserDatabaseService(uid: user.userID).userData,
                builder: (context, snapshot) {
                  User userData = snapshot.data;
                  return Scaffold(
                    body: PageView(
                      children: <Widget>[
                        TopicsScreen(),
                        HotTopicScreen(),
                        RecordBeginScreen(),
                        DiscoverScreen(),
                        ProfileScreen(user: userData),
                      ],
                      controller: pageController,
                      onPageChanged: onPageChanged,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      elevation: 10,
                      currentIndex: pageIndex,
                      type: BottomNavigationBarType.fixed,
                      onTap: onTap,
                      selectedItemColor: Colors.grey[800],
                      unselectedItemColor: Colors.grey[400],
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      selectedFontSize: 12,
                      selectedIconTheme: IconThemeData(size: 30),
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home,
                          ),
                          title: Text("Home"),
                        ),
                        BottomNavigationBarItem(
                          icon: FaIcon(
                            FontAwesomeIcons.fire,
                          ),
                          title: Text("Hot Topic"),
                        ),
                        BottomNavigationBarItem(
                          icon: FaIcon(
                            FontAwesomeIcons.microphone,
                          ),
                          title: Text("Record"),
                        ),
                        BottomNavigationBarItem(
                          icon: FaIcon(FontAwesomeIcons.globeAmericas),
                          title: Text("Discover"),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.book),
                          title: Text("My Book"),
                        ),
                      ],
                    ),
                  );
                })));
  }
}
