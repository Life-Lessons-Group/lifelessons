import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_user_data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile_screens/profile_screen.dart';
import 'record_screens/record_begin_screen.dart';
import '../../features/timeline/presentation/pages/topics_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/root';

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
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
                RecordBeginScreen(),
                ProfileScreen(currentUser: userData),
              ],
              controller: pageController,
              onPageChanged: onPageChanged,
              physics: NeverScrollableScrollPhysics(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: pageIndex,
              onTap: onTap,
              selectedItemColor: Colors.grey[800],
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.mic,
                      size: 35.0,
                    ),
                    title: Text("Record")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book), title: Text("My Book")),
              ],
            ),
          );
        });
  }
}
