import 'package:firebase_flutter_life/data/firebase_collections.dart';
import 'package:firebase_flutter_life/data/firebase_paths.dart';
import 'package:firebase_flutter_life/models/topic_model.dart';


import 'package:flutter/material.dart';

class Topics with ChangeNotifier {
  List<Topic> _topics = [];
  List<Topic> get topics {
    return [..._topics];
  }

  Future<List<Topic>> getTopicsByBook(String book) async {
    var snapshots = await FirebaseCollections.topicsCollectionReference
        .where("book", isEqualTo: book)
        .getDocuments();
    return snapshots.documents.map((doc) => Topic.fromMap(doc.data)).toList();
  }
    Future<List<Topic>> getTopicsByCategory(String category) async {
    var snapshots = await FirebaseCollections.topicsCollectionReference
        .where("category", arrayContains: category)
        .getDocuments();
    return snapshots.documents.map((doc) => Topic.fromMap(doc.data)).toList();
  }
}
