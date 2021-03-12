import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_life/models/user.dart';
import 'package:firebase_flutter_life/Models/private_post_model.dart';
import 'package:firebase_flutter_life/data/firebase_collections.dart';
import 'package:flutter/material.dart';

class PrivateBookScreen extends StatefulWidget {
  final User user;

  const PrivateBookScreen({Key key, this.user}) : super(key: key);

  @override
  _PrivateBookScreenState createState() => _PrivateBookScreenState();
}

class _PrivateBookScreenState extends State<PrivateBookScreen> {
  List<PrivatePost> posts;

  @override
  void initState() {
    super.initState();
    getTimeline();
  }

  getTimeline() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    QuerySnapshot snapshot = await FirebaseCollections.privateCollectionReference
        .document(user.uid)
        .collection("privateUserPosts")
        .getDocuments();
    List<PrivatePost> posts =
        snapshot.documents.map((doc) => PrivatePost.fromDocument(doc)).toList();
    setState(() {
      this.posts = posts;
    });
  }

  buildTimeline() {
    if (posts == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (posts.isEmpty) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 70),
            Icon(
              Icons.filter_none,
              color: Colors.black26,
            ),
            SizedBox(height: 20),
            // Text(
            //   "Family Recipes? ",
            //   style: TextStyle(color: Colors.black, fontSize: 16.0),
            //   textAlign: TextAlign.center,
            // ),
            // Text(
            //   "Family Traditions? ",
            //   style: TextStyle(color: Colors.black, fontSize: 16.0),
            //   textAlign: TextAlign.center,
            // ),
            
            // Text(
            //   "It looks like you haven't started your private book yet.",
            //   style: TextStyle(color: Colors.black26, fontSize: 16.0),
            // ),
            SizedBox(height: 20),
            Text(
              "To start a private book, record a lesson and select the option 'add to private book' ",
              style: TextStyle(color: Colors.black26, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Text(
              "ACCESS TO YOUR PRIVATE BOOK IS BY INVITATION ONLY",
              style: TextStyle(color: Colors.red, fontSize: 10.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 35),
            // SizedBox(
            //   height: 50,
            //   width: 250,
            //           child: FlatButton(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20),
            //           ),
            //     color: Colors.indigo[300],
            //     onPressed: (){ Navigator.pushReplacementNamed(context, '/record-screen');},
            //     child: Text("Record your first private lesson!", style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
            //   ),
            // ),
          ],
        ),
      );
    } else {
      return ListView(children: posts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildTimeline();
  }
}
