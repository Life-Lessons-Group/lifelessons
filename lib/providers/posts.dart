import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_life/data/firebase_collections.dart';
import 'package:firebase_flutter_life/models/hot_post_model.dart';
import 'package:firebase_flutter_life/models/post_model.dart';
import 'package:flutter/widgets.dart';

import '../data/firebase_collections.dart';
import '../models/hot_topic_model.dart';
import '../models/topic_model.dart';

class Posts with ChangeNotifier {
 

  Stream<List<HotPost>> getHotPost(HotTopic topic) {
    var ref = FirebaseCollections.hotTopicCollectionReference
        .document(topic.id)
        .collection("hotPosts");

    return ref.snapshots().map(
        (list) => list.documents.map((doc) => HotPost.fromMap(doc.data)).toList());
  }

  Stream<List<Post>> getPostsByUser(String userID) {
    return FirebaseCollections.postsCollectionReference
        .where("uid", isEqualTo: userID)
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Post.fromMap(doc.data)).toList());
  }

    Stream<List<Post>> getPrivatePostsByUser(String userID) {
    return FirebaseCollections.privateCollectionReference
        .where("uid", isEqualTo: userID)
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Post.fromMap(doc.data)).toList());
  }

  // Future<void> getPosts() async {
  //   var snapshots =
  //       await FirebaseCollections.postsCollectionReference.getDocuments();
  //   _posts = snapshots.documents.map((doc) => Post.fromMap(doc.data)).toList();

  // }

  // Future<List<Post>> getPosts() async {
  //   final snapshots =
  //       await FirebaseCollections.postsCollectionReference.getDocuments();
  //   return snapshots.documents.map((doc) => Post.fromMap(doc.data)).toList();
  // }
  // Future<List<Post>> getPosts(
  //   String collection,
  //   String id,
  // ) {
  //   switch (collection) {
  //     case "favorites":
  //       {
  //         return FirebaseCollections.favoritesCollectionReference
  //             .snapshots()
  //             .map((QuerySnapshot snapshot) =>
  //                 snapshot.documents.map((e) => Post.fromMap(e.data)).toList());
  //       }
  //       break;
  //     case "userPosts":
  //       {
  //         return FirebaseCollections.postsCollectionReference
  //             .where("uid", isEqualTo: id)
  //             .snapshots()
  //             .map((QuerySnapshot snapshot) =>
  //                 snapshot.documents.map((e) => Post.fromMap(e.data)).toList());
  //       }
  //       break;
  //     case "byTopic":
  //       {
  //         return FirebaseCollections.postsCollectionReference
  //             .where("lessonTopic", isEqualTo: id)
  //             .snapshots()
  //             .map((QuerySnapshot snapshot) =>
  //                 snapshot.documents.map((e) => Post.fromMap(e.data)).toList());
  //       }
  //       break;
  //     case "byCategory":
  //       {
  //         FirebaseCollections.postsCollectionReference
  //             .where("category", isEqualTo: id)
  //             .snapshots()
  //             .map((QuerySnapshot snapshot) =>
  //                 snapshot.documents.map((e) => Post.fromMap(e.data)).toList());
  //       }
  //       break;
  //     case "private":
  //       {
  //         return FirebaseCollections.privateCollectionReference
  //             .where("uid", isEqualTo: id)
  //             .snapshots()
  //             .map((QuerySnapshot snapshot) =>
  //                 snapshot.documents.map((e) => Post.fromMap(e.data)).toList());
  //       }
  //   }

  //   return FirebaseCollections.postsCollectionReference.snapshots().map(
  //       (QuerySnapshot snapshot) =>
  //           snapshot.documents.map((e) => Post.fromMap(e.data)).toList());
  // }

  Future<List<Post>> getFavorites(String uid) async {
    var snapshots = await FirebaseCollections.favoritesCollectionReference
        .document(uid)
        .collection("userFavorites")
        .getDocuments();
    return snapshots.documents.map((doc) => Post.fromMap(doc.data)).toList();
  }

  Future<List<Post>> getPostsByTopic(String topic) async {
    var snapshots = await FirebaseCollections.postsCollectionReference
        .where("lessonTopic", isEqualTo: topic)
        .getDocuments();
    return snapshots.documents.map((doc) => Post.fromMap(doc.data)).toList();
  }
}
