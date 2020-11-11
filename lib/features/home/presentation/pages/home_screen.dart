import 'package:firebase_flutter_life/UI/screens/profile_screens/profile_screen.dart';
import 'package:firebase_flutter_life/UI/screens/record_screens/record_begin_screen.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_user_data_service.dart';
import 'package:firebase_flutter_life/features/discover/presentation/pages/discover_screen.dart';
import 'package:firebase_flutter_life/features/hot_topic/presentation/pages/hot_topic_screen.dart';
import 'package:firebase_flutter_life/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:firebase_flutter_life/features/timeline/presentation/pages/topics_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
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

    return StreamBuilder<User>(
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
                ProfileScreen(currentUser: userData),
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
        });
  }
}
