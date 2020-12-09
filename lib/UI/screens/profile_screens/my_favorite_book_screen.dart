import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/posts/data/models/post_model.dart';

import 'package:firebase_flutter_life/features/posts/presentation/provider/posts.dart';

import 'package:firebase_flutter_life/features/posts/presentation/widgets/post_tile.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavoriteBookScreen extends StatefulWidget {
  final User currentUser;

  const MyFavoriteBookScreen({Key key, this.currentUser}) : super(key: key);

  @override
  _MyFavoriteBookScreenState createState() => _MyFavoriteBookScreenState();
}

class _MyFavoriteBookScreenState extends State<MyFavoriteBookScreen> {
  Future _getPosts;

  @override
  void initState() {
    _getPosts = Posts().getPostsByUser(widget.currentUser.userID);
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
