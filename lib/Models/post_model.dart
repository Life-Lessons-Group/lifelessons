import 'package:firebase_flutter_life/data/firebase_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Post with ChangeNotifier {
  final String lessonTitle;
  final String lessonTopic;
  final String postID;
  final String uid;
  final String recordingURL;
  final String username;
  final dynamic likes;
  bool isFavorite;

  Post({
    @required this.lessonTitle,
    @required this.lessonTopic,
    @required this.postID,
    @required this.uid,
    @required this.recordingURL,
    @required this.username,
    this.likes,
    this.isFavorite = false,
  });

  factory Post.fromMap(Map doc) {
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

  toggleFavoriteStatus(String currentUserID, String postID) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    await FirebaseCollections.favoritesCollectionReference
        .document(currentUserID)
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
}

// showProfile(context, profileID) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => UserProfileScreen(profileID: profileID),
//     ),
//   );
// }
