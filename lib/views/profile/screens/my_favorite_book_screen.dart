import 'package:firebase_flutter_life/models/user.dart';
import 'package:firebase_flutter_life/models/post_model.dart';

import 'package:firebase_flutter_life/views/posts/post_tile.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavoriteBookScreen extends StatelessWidget {
  final User currentUser;

  const MyFavoriteBookScreen({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var posts = Provider.of<List<Post>>(context);
    if (posts.isEmpty) {
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
              "Uh oh, you don't have any favorite lessons!",
              style: TextStyle(color: Colors.black26, fontSize: 16.0),
            ),
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
        ),
      );
    }
  }
}
