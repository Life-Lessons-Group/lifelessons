import 'package:firebase_flutter_life/models/hot_post_model.dart';
import 'package:firebase_flutter_life/providers/posts.dart';
import 'package:firebase_flutter_life/views/hot_topic/hot_topic_post_tile.dart';

import 'package:firebase_flutter_life/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotTopicPostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var posts = Provider.of<List<HotPost>>(context);
    if (posts == null) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 70),
            Icon(
              Icons.filter_none,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              "Be the first to post about this Hot Topic!",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            SizedBox(height: 20),
            Text("Click the microphone to start recording!",
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            SizedBox(height: 20),
          ],
        ),
      );
    } else if (posts.isEmpty) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 70),
            Icon(
              Icons.filter_none,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              "Be the first to post about this Hot Topic!",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            SizedBox(height: 20),
            Text("Click the microphone to start recording!",
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            SizedBox(height: 20),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (ctx, i) => HotTopicPostTile(
          uid: posts[i].uid,
        ),
      );
    }
  }
}
