
import 'package:firebase_flutter_life/models/user.dart';
import 'package:firebase_flutter_life/providers/posts.dart';

import 'package:firebase_flutter_life/views/posts/post_tile.dart';

import 'package:firebase_flutter_life/models/post_model.dart';
import 'package:flutter/material.dart';


class PublicBookScreen extends StatefulWidget {
  final User user;

  const PublicBookScreen({Key key, this.user}) : super(key: key);

  @override
  _PublicBookScreenState createState() => _PublicBookScreenState();
}

class _PublicBookScreenState extends State<PublicBookScreen> {
  Future _getPosts;

  @override
  void initState() {
    _getPosts = Posts().getPostsByUser(widget.user.userID);
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
    );
  }
}
