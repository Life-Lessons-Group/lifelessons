import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/posts/data/models/post_model.dart';
import 'package:firebase_flutter_life/features/posts/presentation/provider/posts.dart';
import 'package:firebase_flutter_life/features/posts/presentation/widgets/post_tile.dart';

import 'package:flutter/material.dart';

class SelectedTopicScreen extends StatefulWidget {
  final User user;
  final String topic;

  SelectedTopicScreen({Key key, this.user, this.topic}) : super(key: key);

  @override
  _SelectedTopicScreenState createState() => _SelectedTopicScreenState();
}

class _SelectedTopicScreenState extends State<SelectedTopicScreen> {
  Future _getPosts;

  @override
  void initState() {
    _getPosts = Posts().getPostsByTopic(widget.topic);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.topic)),
      body: FutureBuilder(
        future: _getPosts,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Post> posts = snapshot.data;
          Widget child;

          if (snapshot.connectionState == ConnectionState.waiting) {
            child = Container(
              key: ValueKey(0),
            );
          } else {
            child = ListView.builder(
              key: ValueKey(1),
              itemCount: posts.length,
              itemBuilder: (ctx, i) => PostTile(
                lessonTitle: posts[i].lessonTitle,
                uid: posts[i].uid,
                lessonTopic: posts[i].lessonTopic,
                recordingURL: posts[i].recordingURL,
              ),
            );
          }
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: child,
          );
        },
      ),
    );
  }
}
