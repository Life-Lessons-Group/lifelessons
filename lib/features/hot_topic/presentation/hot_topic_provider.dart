import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_life/features/hot_topic/data/models/hot_topic_model.dart';
import 'package:firebase_flutter_life/features/topics/data/datasources/firebase_collections.dart';
import 'package:firebase_flutter_life/features/topics/data/datasources/firebase_paths.dart';
import 'package:flutter/material.dart';

class HotTopicProvider extends ChangeNotifier {
  HotTopic _hotTopic = HotTopic();
  HotTopic get hotTopic => _hotTopic;

  void updateState() async {
    _hotTopic = await getCurrentHotTopic();
    notifyListeners();
  }
}

Future<HotTopic> getCurrentHotTopic() async {
  HotTopic _retVal = HotTopic();

  DocumentSnapshot _snapshot = await FirebaseCollections
      .topicsCollectionReference
      .document(FirebasePaths.hotTopicsPath)
      .collection("2020")
      .document("leader")
      .get();

  _retVal = HotTopic.fromMap(_snapshot.data);
  return _retVal;
}
