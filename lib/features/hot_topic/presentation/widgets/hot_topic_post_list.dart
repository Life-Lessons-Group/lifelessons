import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/posts/presentation/provider/posts.dart';
import 'package:firebase_flutter_life/features/posts/presentation/widgets/post_list.dart';
import 'package:firebase_flutter_life/features/posts/presentation/widgets/post_tile.dart';
import 'package:firebase_flutter_life/features/topics/data/datasources/firebase_collections.dart';
import 'package:firebase_flutter_life/features/posts/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotTopicPostList extends StatefulWidget {
  @override
  _HotTopicPostListState createState() => _HotTopicPostListState();
}

class _HotTopicPostListState extends State<HotTopicPostList> {
  Future _getPosts;

  @override
  void initState() {
    _getPosts = Posts().getPostsByTopic("Hot Topic");
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
          child = ListView.builder(
            key: ValueKey(1),
            itemCount: posts.length,
            itemBuilder: (ctx, i) => PostTile(
              lessonTitle: posts[i].lessonTitle,
              uid: posts[i].uid,
              lessonTopic: posts[i].lessonTopic,
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
