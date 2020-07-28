import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_life/UI/screens/record_screens/record_begin_screen.dart';
import 'package:firebase_flutter_life/UI/screens/record_screens/test_record_screen.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/timeline/data/repositories/posts_repository.dart';

import 'package:firebase_flutter_life/Models/models.dart';
import 'package:firebase_flutter_life/features/timeline/data/models/post_model.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';


class MyPublicBookScreen extends StatefulWidget {
 final User currentUser;

  const MyPublicBookScreen({Key key, this.currentUser}) : super(key: key);

 

  @override
  _MyPublicBookScreenState createState() => _MyPublicBookScreenState();
}

class _MyPublicBookScreenState extends State<MyPublicBookScreen> {
  List<Post> posts;

  @override
  void initState() {
    super.initState();
    getTimeline();
  }

  getTimeline() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    QuerySnapshot snapshot = await PostRepository()
        .postsRef
        .where("userID", isEqualTo: user.uid)
        .getDocuments();
    List<Post> posts =
        snapshot.documents.map((doc) => Post.fromDocument(doc)).toList();
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
            Text(
              "Uh oh, you don't have any lessons!",
              style: TextStyle(color: Colors.black26, fontSize: 16.0),
            ),
            SizedBox(height: 20),
            Text("Get started and record a new lesson today!",
                style: TextStyle(color: Colors.black26, fontSize: 16.0)),
            SizedBox(height: 20),
            // SizedBox(
            //   height: 50,
            //   width: 250,
            //   child: FlatButton(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     color: Colors.indigo[300],
            //          onPressed: () {
            //     },
            //     child: Text(
            //       "Record your first lesson!",
            //       style: TextStyle(color: Colors.white),
            //     ),
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
