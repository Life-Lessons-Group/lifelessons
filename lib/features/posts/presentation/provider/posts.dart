import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_life/features/topics/data/datasources/firebase_collections.dart';
import 'package:firebase_flutter_life/features/posts/data/models/post_model.dart';
import 'package:flutter/widgets.dart';

class Posts with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> findByTopic(String topic) {
    return _posts.where((post) => post.lessonTopic == topic).toList();
  }

  // Stream<List<Post>> findByUser(String uid) {
  //   return posts.where((post) => post.uid == uid);
  // }

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

  Future<List<Post>> getPostsByUser(String userID) async {
    var snapshots = await FirebaseCollections.postsCollectionReference
        .where("uid", isEqualTo: userID)
        .getDocuments();
    return snapshots.documents.map((doc) => Post.fromMap(doc.data)).toList();
  }

  Future<List<Post>> getPostsByTopic(String topic) async {
    var snapshots = await FirebaseCollections.postsCollectionReference
        .where("lessonTopic", isEqualTo: topic)
        .getDocuments();
    return snapshots.documents.map((doc) => Post.fromMap(doc.data)).toList();
  }

  Future<List<Post>> getHotPostsByTopic(String topic) async {
    var snapshots = await FirebaseCollections.postsCollectionReference
        .where("lessonTopic", isEqualTo: topic)
        .getDocuments();
    return snapshots.documents.map((doc) => Post.fromMap(doc.data)).toList();
  }

  
}
