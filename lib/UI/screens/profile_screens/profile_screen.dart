import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_life/Services/firebase_service.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';

import 'package:firebase_flutter_life/features/settings/presentation/pages/settings_screen.dart';

import 'package:firebase_flutter_life/features/profile/presentation/widgets/book_tab.dart';
import 'package:firebase_flutter_life/features/topics/data/datasources/firebase_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

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
  final usersRef = Firestore.instance.collection('users');

  int postCount = 0;
  int followerCount = 0;
  int followingCount = 0;

  File _image;
  final picker = ImagePicker();
  final fire = FirebaseService();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      fire.photoUpload(
          file: _image,
          path: pickedFile.path,
          contentType: 'image/jpeg',
          userID: widget.currentUser.userID);
    });
  }

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
//GET FOLLOWERS
  getFollowing() async {
    QuerySnapshot snapshot = await followingRef
        .document(widget.currentUser.userID)
        .collection('userFollowing')
        .getDocuments();
    setState(() {
      followingCount = snapshot.documents.length;
    });
  }

//POST COUNT
  getPostCount() async {
    QuerySnapshot snapshot = await FirebaseCollections.postsCollectionReference
        .where("uid", isEqualTo: widget.currentUser.userID)
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
                      "your book",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                    AppDrawerButton(),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => getImage(),
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: widget.currentUser.profileImageURL !=
                                null
                            ? NetworkImage(widget.currentUser.profileImageURL)
                            : AssetImage('assets/images/logo.jpeg'),
                      ),
                      Positioned(
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.grey[600],
                        ),
                        bottom: 1,
                        right: 1,
                      ),
                    ],
                  ),
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
                    Text("United States",
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
                    SizedBox(height: 5),
                    Text(
                      "your book",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
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
    return ToggleLessonView(currentUser: widget.currentUser);
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
