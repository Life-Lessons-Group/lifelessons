
import 'package:firebase_flutter_life/models/user.dart';
import 'package:firebase_flutter_life/services/shared_prefs.dart';
import 'package:firebase_flutter_life/views/profile/screens/private_book_view.dart';
import 'package:firebase_flutter_life/views/profile/screens/public_book_view.dart';

import 'package:flutter/material.dart';
import 'package:showcaseview/showcase.dart';
import 'package:showcaseview/showcase_widget.dart';

class ToggleLessonView extends StatefulWidget {
  final User user;

  const ToggleLessonView({Key key, this.user}) : super(key: key);
  @override
  _ToggleLessonViewState createState() => _ToggleLessonViewState();
}

class _ToggleLessonViewState extends State<ToggleLessonView>
    with TickerProviderStateMixin {
  List<Tab> tabList = List();
  TabController _tabController;
  final _privateKey = GlobalKey();

  @override
  void initState() {
    tabList.add(Tab(
      text: 'Public',
      icon: Icon(Icons.public),
    ));
    tabList.add(Tab(
      text: 'Private',
      icon: Icon(Icons.lock_outline),
    ));
    // tabList.add(Tab(
    //   text: 'Favorite',
    //   icon: Icon(Icons.favorite_border),
    // ));
    super.initState();
    _tabController = TabController(vsync: this, length: tabList.length);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SharedPrefs.isFirstVisit("profileScreenVisit").then((result) {
        if (result) ShowCaseWidget.of(context).startShowCase([_privateKey]);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Showcase(
            contentPadding: EdgeInsets.all(10),
            title: "Your Private Book.",
            description:
                'Here, you can speak on anything you\nwish to share with those near & dear, by invitation.',
            key: _privateKey,
            child: Container(
              constraints: BoxConstraints.expand(height: 60),
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.grey[300],
                labelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: <Color>[
                      Colors.lightGreen[200],
                      Colors.lightBlue[600],
                    ],
                  ),
                ),
                tabs: tabList,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  PublicBookScreen(
                    user: widget.user,
                  ),
                  PrivateBookScreen(
                    user: widget.user,
                  ),
                  // MyFavoriteBookScreen(
                  //   currentUser: widget.currentUser,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
