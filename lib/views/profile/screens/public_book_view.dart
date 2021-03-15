import 'package:firebase_flutter_life/models/user.dart';
import 'package:firebase_flutter_life/providers/posts.dart';

import 'package:firebase_flutter_life/views/posts/post_tile.dart';

import 'package:firebase_flutter_life/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicBookScreen extends StatelessWidget {
  final User user;

  const PublicBookScreen({Key key, this.user}) : super(key: key);

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
            Text(
              "Uh oh, you don't have any lessons!",
              style: TextStyle(color: Colors.black26, fontSize: 16.0),
            ),
            SizedBox(height: 20),
            Text("Get started and record a new lesson today!",
                style: TextStyle(color: Colors.black26, fontSize: 16.0)),
            SizedBox(height: 20),
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
