import 'package:firebase_flutter_life/models/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfileHeader extends StatelessWidget {
  final User user;

  const UserProfileHeader({this.user});

  // final audienceRef = Firestore.instance.collection('audience');
  // final classmatesRef = Firestore.instance.collection('classmates');

  // bool acessGranted = false;
  // bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   checkIfAcessGranted();
  // }

  // checkIfAcessGranted() async {
  //   var currentUser = await FirebaseAuth.instance.currentUser();
  //   String currentUserId = currentUser.uid;
  //   DocumentSnapshot doc = await audienceRef
  //       .document(currentUserId)
  //       .collection('followers')
  //       .document(widget.user.userID)
  //       .get();
  //   setState(() {
  //     acessGranted = doc.exists;
  //   });
  // }

  // handleAcessGranted() async {
  //   var currentUser = await FirebaseAuth.instance.currentUser();
  //   String currentUserId = currentUser.uid;
  //   setState(() {
  //     acessGranted = true;
  //   });
  //   // Make user follower of auth user (update your following collection)
  //   audienceRef
  //       .document(currentUserId)
  //       .collection('followers')
  //       .document(widget.user.userID)
  //       .setData({});
  //   // Put THAT user on YOUR following collection (update your following collection)
  //   classmatesRef
  //       .document(widget.user.userID)
  //       .collection('following')
  //       .document(currentUserId)
  //       .setData({});
  // }

  // handleRemoveAcess() async {
  //   var currentUser = await FirebaseAuth.instance.currentUser();
  //   String currentUserId = currentUser.uid;
  //   setState(() {
  //     acessGranted = false;
  //   });
  //   // remove follower
  //   audienceRef
  //       .document(currentUserId)
  //       .collection('followers')
  //       .document(widget.user.userID)
  //       .get()
  //       .then((doc) {
  //     if (doc.exists) {
  //       doc.reference.delete();
  //     }
  //   });
  //   // remove following
  //   classmatesRef
  //       .document(widget.user.userID)
  //       .collection('following')
  //       .document(currentUserId)
  //       .get()
  //       .then((doc) {
  //     if (doc.exists) {
  //       doc.reference.delete();
  //     }
  //   });
  // }

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

  // buildProfileButton() {
  //   if (acessGranted) {
  //     return buildButton(
  //       text: "Block From Private Book",
  //       function: handleRemoveAcess,
  //     );
  //   } else if (!acessGranted) {
  //     return buildButton(
  //       text: "Give Private Book Access",
  //       function: handleAcessGranted,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
                    Container(),
                    Text(
                      "${user.username}'s Book",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    Container(),
                  ],
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(user.profileImageURL ??
                      "gs://life-lessons-beta-2682c.appspot.com/logo.jpeg"),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
