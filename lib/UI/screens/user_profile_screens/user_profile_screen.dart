import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_life/Data/user_repository.dart';
import 'package:firebase_flutter_life/Models/models.dart';
import 'package:firebase_flutter_life/Pickers/user_image_picker.dart';
import 'package:firebase_flutter_life/UI/screens/settings_screen.dart';
import 'package:firebase_flutter_life/UI/screens/user_profile_screens/user_book_tab.dart';

import 'package:firebase_flutter_life/UI/widgets/book_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  final String profileID;

  const UserProfileScreen({Key key, this.profileID}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final audienceRef = Firestore.instance.collection('audience');
  final classmatesRef = Firestore.instance.collection('classmates');

  bool acessGranted = false;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    checkIfAcessGranted();
  }

  checkIfAcessGranted() async {
    var currentUser = await FirebaseAuth.instance.currentUser();
    String currentUserId = currentUser.uid;
    DocumentSnapshot doc = await audienceRef
        .document(currentUserId)
        .collection('followers')
        .document(widget.profileID)
        .get();
    setState(() {
      acessGranted = doc.exists;
    });
  }

  handleAcessGranted() async {
    var currentUser = await FirebaseAuth.instance.currentUser();
    String currentUserId = currentUser.uid;
    setState(() {
      acessGranted = true;
    });
    // Make user follower of auth user (update your following collection)
    audienceRef
        .document(currentUserId)
        .collection('followers')
        .document(widget.profileID)
        .setData({});
    // Put THAT user on YOUR following collection (update your following collection)
    classmatesRef
        .document(widget.profileID)
        .collection('following')
        .document(currentUserId)
        .setData({});
  }

  handleRemoveAcess() async {
    var currentUser = await FirebaseAuth.instance.currentUser();
    String currentUserId = currentUser.uid;
    setState(() {
      acessGranted = false;
    });
    // remove follower
    audienceRef
        .document(currentUserId)
        .collection('followers')
        .document(widget.profileID)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // remove following
    classmatesRef
        .document(widget.profileID)
        .collection('following')
        .document(currentUserId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  Container buildButton({String text, Function function}) {
    return Container(
      padding: EdgeInsets.only(top: 2.0),
      child: FlatButton(
        onPressed: function,
        child: Container(
          width: 300.0,
          height: 40.0,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  buildProfileButton()  {
   
    if (acessGranted) {
      return buildButton(
        text: "Block From Private Book",
        function: handleRemoveAcess,
      );
    } else if (!acessGranted) {
      return buildButton(
        text: "Give Private Book Access",
        function: handleAcessGranted,
      );
    } 
  }

  buildProfileHeader() {
    return FutureBuilder(
        future: UserRepository().usersRef.document(widget.profileID).get(),
        builder: (context, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return skeletonHeader();
          }
          User user = User.fromDocument(futureSnapshot.data);
          print("USER: $user");
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
                              icon: Icon(Icons.arrow_back),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          Text(
                            "${user.username}'s Book",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          IconButton(
                              icon: Icon(Icons.menu),
                              color: Colors.transparent,
                              onPressed: () {}),
                        ],
                      ),
                      SizedBox(height: 20),
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(user.profileImageUrl),
                      ),
                      SizedBox(height: 10),
                      Text(
                        user.username,
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
                      buildProfileButton(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
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
    return UserToggleLessonView(
      profileID: widget.profileID,
    );
  }

  buildProfileScreen() {
    return Material(
      child: Container(
        color: Colors.white24,
        child: Column(
          children: <Widget>[
            buildProfileHeader(),
            SizedBox(height: 10),
            toggleBookView()
          ],
        ),
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
