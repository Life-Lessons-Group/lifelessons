import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_user_data_service.dart';

import 'package:firebase_flutter_life/features/timeline/data/repositories/posts_repository.dart';

import 'package:firebase_flutter_life/features/settings/presentation/pages/settings_screen.dart';

import 'package:firebase_flutter_life/features/profile/presentation/widgets/book_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final User currentUser;
  static const routeName = 'profile-screen';

  const ProfileScreen({Key key, this.currentUser}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final followersRef = Firestore.instance.collection('followers');
  final followingRef = Firestore.instance.collection('following');

  int postCount = 0;
  int followerCount = 0;
  int followingCount = 0;

  @override
  void initState() {
    super.initState();
    print('CURRENT USER:');
    print(widget.currentUser.username);
    getPostCount();
    getFollowers();
    getFollowing();
  }

  getFollowers() async {
    QuerySnapshot snapshot = await followersRef
        .document(widget.currentUser.userID)
        .collection('userFollowers')
        .getDocuments();
    setState(() {
      followerCount = snapshot.documents.length;
    });
  }

  getFollowing() async {
    QuerySnapshot snapshot = await followingRef
        .document(widget.currentUser.userID)
        .collection('userFollowing')
        .getDocuments();
    setState(() {
      followingCount = snapshot.documents.length;
    });
  }

  getPostCount() async {
    QuerySnapshot snapshot = await PostRepository()
        .postsRef
        .where("userID", isEqualTo: widget.currentUser.userID)
        .getDocuments();
    setState(() {
      postCount = snapshot.documents.length;
    });
  }

  buildProfileHeader() {
    return Container(
      height: 320,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: <Color>[
                  Colors.lightGreen[200],
                  Colors.lightBlue[600],
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.inbox),
                      color: Colors.transparent,
                      onPressed: () {},
                    ),
                    Text(
                      "Your Book",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    AppDrawerButton(),
                  ],
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 40.0,
                   backgroundImage: widget.currentUser.profileImageUrl != null
                ? Image.network(widget.currentUser.profileImageUrl)
                : AssetImage('assets/images/placeholder-user.png'),
                ),
                SizedBox(height: 10),
                Text(
                  widget.currentUser.username,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.white70,
                      size: 12,
                    ),
                    Text("Washington, D.C.",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          followerCount.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Audience",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          followingCount.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Classmates",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          postCount.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Lessons",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  skeletonHeader() {
    // Skeleton Header while connecting to network
    return Container(
      height: 320,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: <Color>[
                  Colors.lightGreen[200],
                  Colors.lightBlue[600],
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.inbox),
                      color: Colors.transparent,
                      onPressed: () {},
                    ),
                    Text(
                      "Your Book",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    AppDrawerButton(),
                  ],
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(height: 10),
                Container(
                  width: 10,
                  color: Colors.white70,
                ),
                SizedBox(height: 5),
                Container(
                  width: 10,
                  color: Colors.white70,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 10,
                      color: Colors.white70,
                    ),
                    Container(
                      width: 10,
                      color: Colors.white70,
                    ),
                    Container(
                      width: 10,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  toggleBookView() {
    return ToggleLessonView();
  }

  buildProfileScreen() {
    return Container(
      color: Colors.white24,
      child: Column(
        children: <Widget>[
          buildProfileHeader(),
          SizedBox(height: 10),
          toggleBookView(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildProfileScreen();
  }
}

class AppDrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      color: Colors.white70,
      onPressed: () {
        var appDrawerRoute = MaterialPageRoute(
          builder: (BuildContext context) => AppDrawer(),
        );
        Navigator.of(context).push(appDrawerRoute);
      },
    );
  }
}
