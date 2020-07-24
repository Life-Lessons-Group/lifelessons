import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_life/Services/firebase_service.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_user_data_service.dart';
import 'package:firebase_flutter_life/features/timeline/data/repositories/posts_repository.dart';

import 'package:firebase_flutter_life/Models/models.dart';
import 'package:firebase_flutter_life/Services/audio_service.dart';

import 'package:firebase_flutter_life/UI/screens/user_profile_screens/user_profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Post extends StatefulWidget {
  final String lessonTitle;
  final String lessonTopic;
  final String postID;
  final String uid;
  final String recordingURL;
  final String username;
  final dynamic likes;

  Post({
    @required this.lessonTitle,
    @required this.lessonTopic,
    @required this.postID,
    @required this.uid,
    @required this.recordingURL,
    @required this.username,
    this.likes,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      lessonTitle: doc["lessonTitle"],
      lessonTopic: doc["lessonTopic"],
      postID: doc["postID"],
      uid: doc["uid"],
      recordingURL: doc["recordingURL"],
      username: doc["username"],
      likes: doc['likes'],
    );
  }
  @override
  _PostState createState() => _PostState(
       lessonTitle: this.lessonTitle,
        lessonTopic: this.lessonTopic,
        postID: this.postID,
        uid: this.uid,
        recordingURL: this.recordingURL,
        username: this.username,
        likes: this.likes,
      );
}

class _PostState extends State<Post> {
  final String lessonTitle;
  final String lessonTopic;
  final String postID;
  final String uid;
  final String recordingURL;
  final String username;
 
  bool showHeart = false;
  bool isLiked;
  int likeCount;
  Map likes;
  bool isPlaying = false;

  _PostState({
    this.lessonTitle,
    this.lessonTopic,
    this.postID,
    this.uid,
    this.recordingURL,
    this.username,
    this.likeCount,
    this.likes,
  });

  buildPostHeader(BuildContext context) {
    return StreamBuilder<User>(
        stream: UserDatabaseService(uid: uid).userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircleAvatar(
              backgroundColor: Colors.grey,
            );
          }
          User user = snapshot.data;

          return CircleAvatar(
            radius: 30,
            backgroundImage: user.profileImageURL != null
                ? NetworkImage(user.profileImageURL)
                : AssetImage('assets/images/logo.jpeg'),
          );
        });
  }

  handleLikePost() async {
    var currentUser = await FirebaseAuth.instance.currentUser();
    String currentUserId = currentUser.uid;
    bool _isLiked = likes[currentUserId] == true;

    if (_isLiked) {
      PostRepository()
          .postsRef
          .document(postID)
          .updateData({'likes.$currentUserId': false});
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else if (!_isLiked) {
      PostRepository()
          .postsRef
          .document(postID)
          .updateData({'likes.$currentUserId': true});
      addToFavorites();
      setState(() {
        likeCount += 1;
        isLiked = true;
        likes[currentUserId] = true;
        showHeart = true;
      });
      Timer(Duration(milliseconds: 500), () {
        setState(() {
          showHeart = false;
        });
      });
    }
  }

  addToFavorites() async {
    var currentUser = await FirebaseAuth.instance.currentUser();
    String currentUserId = currentUser.uid;
    PostRepository()
        .favoritesRef
        .document(currentUserId)
        .collection("userFavorites")
        .document(postID)
        .setData({
      "lessonTitle": lessonTitle,
      "lessonTopic": lessonTopic,
      "postID": postID,
      "uid": uid,
      "recordingURL": recordingURL,
      "username": username,
      "likes": {},
    });
  }

  showProfile(context, profileID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfileScreen(profileID: profileID),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    isLiked = (likes[user.userID] == true);
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
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          color: Colors.white,
          elevation: isPlaying ? 10 : 1,
          child: ListTile(
            leading: buildPostHeader(context),
            title: AutoSizeText(
              lessonTitle,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
              maxLines: 1,
            ),
            subtitle: AutoSizeText(
             lessonTopic,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              maxLines: 1,
            ),
            trailing: GestureDetector(
              onTap: handleLikePost,
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                size: 28.0,
                color: Colors.lightGreen[100],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
