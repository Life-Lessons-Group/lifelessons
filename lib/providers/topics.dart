import 'package:firebase_flutter_life/data/firebase_collections.dart';

import 'package:firebase_flutter_life/models/topic_model.dart';

import 'package:flutter/material.dart';

import '../data/firebase_collections.dart';
import '../models/hot_topic_model.dart';
import '../models/topic_model.dart';
import '../models/topic_model.dart';

class TopicsProvider with ChangeNotifier {


  Stream<List<Topic>> getTopicsByBookStream(String book) {
    return FirebaseCollections.topicsCollectionReference
        .where("book", isEqualTo: book)
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Topic.fromMap(doc.data)).toList());
  }

  Future<List<Topic>> getTopicsByCategory(String category) async {
    var snapshots = await FirebaseCollections.topicsCollectionReference
        .where("category", arrayContains: category)
        .getDocuments();
    return snapshots.documents.map((doc) => Topic.fromMap(doc.data)).toList();
  }

  Stream<HotTopic> hotTopic(String topicID) {
    return FirebaseCollections.hotTopicCollectionReference
        .document(topicID)
        .snapshots()
        .map((snap) => HotTopic.fromMap(snap.data));
  }

  Stream<HotTopic> 
}
