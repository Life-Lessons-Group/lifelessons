import 'package:firebase_flutter_life/models/user.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/post_model.dart';
import '../../posts/post_tile.dart';

class PrivateBookScreen extends StatelessWidget {
  final User user;

  const PrivateBookScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var posts = Provider.of<List<Post>>(context);
    if (posts == null) {
      return Container(
        height: 5,
        width: 5,
        color: Colors.white,
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
      return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (ctx, i) => PostTile(
          lessonTitle: posts[i].lessonTitle,
          uid: posts[i].uid,
          lessonTopic: posts[i].lessonTopic,
          recordingURL: posts[i].recordingURL,
        ),
      );
    }
  }
}
