import 'package:firebase_flutter_life/providers/posts.dart';
import 'package:firebase_flutter_life/views/hot_topic/hot_topic_post_tile.dart';

import 'package:firebase_flutter_life/models/post_model.dart';
import 'package:flutter/material.dart';

class HotTopicPostList extends StatefulWidget {
  final String topic;

  const HotTopicPostList({this.topic});
  @override
  _HotTopicPostListState createState() => _HotTopicPostListState();
}

class _HotTopicPostListState extends State<HotTopicPostList> {
  Future _getPosts;

  @override
  void initState() {
    _getPosts = Posts().getHotPostsByTopic(widget.topic);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPosts,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        List<Post> posts = snapshot.data;
        Widget child;

        if (snapshot.connectionState == ConnectionState.waiting) {
          child = Container(
            key: ValueKey(0),
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
          child = ListView.builder(
            key: ValueKey(1),
            itemCount: posts.length,
            itemBuilder: (ctx, i) => HotTopicPostTile(
              uid: posts[i].uid,
            ),
          );
        }
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: child,
        );
      },
    );
  }
}
