import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_flutter_life/Models/models.dart';
import 'package:firebase_flutter_life/Services/audio_service.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_user_data_service.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrivatePost extends StatefulWidget {
  final String title;
  final String topic;
  final String postID;
  final String userID;
  final String recordingURL;
  final String username;
  final String userImage;

  PrivatePost({
    @required this.title,
    @required this.topic,
    @required this.postID,
    @required this.userID,
    @required this.recordingURL,
    @required this.username,
    @required this.userImage,
  });

  factory PrivatePost.fromDocument(DocumentSnapshot doc) {
    return PrivatePost(
      title: doc["title"],
      topic: doc["topic"],
      postID: doc["postID"],
      userID: doc["userID"],
      recordingURL: doc["recordingURL"],
      username: doc["username"],
      userImage: doc["userImage"],
    );
  }
  @override
  _PrivatePostState createState() => _PrivatePostState(
        title: this.title,
        topic: this.topic,
        postID: this.postID,
        userID: this.userID,
        recordingURL: this.recordingURL,
        username: this.username,
        userImage: this.userImage,
      );
}

class _PrivatePostState extends State<PrivatePost> {
  final String title;
  final String topic;
  final String postID;
  final String userID;
  final String recordingURL;
  final String username;
  final String userImage;
  bool showHeart = false;
  bool isLiked = false;
  int likeCount;
  bool isPlaying = false;

  _PrivatePostState({
    this.title,
    this.topic,
    this.postID,
    this.userID,
    this.recordingURL,
    this.username,
    this.userImage,
    this.likeCount,
  });

  buildPostHeader() {
    return StreamBuilder(
        stream: UserDatabaseService(uid: userID).userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircleAvatar(
              backgroundColor: Colors.grey,
            );
          }
          User user = snapshot.data;
          return CircleAvatar(
            backgroundImage: user.profileImageUrl != null
                ? Image.network(user.profileImageUrl)
                : AssetImage('assets/images/logo.jpeg'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          AudioService().play(recordingURL);
          setState(() {
            isPlaying = true;
          });
        },
        child: Card(
          color: Colors.white,
          elevation: isPlaying ? 10 : 1,
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            leading: buildPostHeader(),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
            ),
            subtitle: Text(
              topic,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
