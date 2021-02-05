import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/views/profile/screens/private_book_view.dart';
import 'package:firebase_flutter_life/views/profile/screens/public_book_view.dart';

import 'package:flutter/material.dart';

class UserBookTab extends StatefulWidget {
  final User user;

  const UserBookTab({Key key, this.user}) : super(key: key);
  @override
  _UserBookTabState createState() => _UserBookTabState();
}

class _UserBookTabState extends State<UserBookTab>
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

    super.initState();
    _tabController = TabController(vsync: this, length: tabList.length);
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
          Container(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
