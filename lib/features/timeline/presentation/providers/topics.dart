import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_life/features/timeline/data/models/topic.dart';
import 'package:firebase_flutter_life/features/timeline/data/repositories/topics_repository.dart';
import 'package:flutter/material.dart';

class Topics with ChangeNotifier {
  List<Topic> _items = [];
  List<Topic> get items {
    return [..._items];
  }

  List<Topic> findByBook(String book) {
    return _items.where((topic) => topic.book == book).toList();
  }

  Future<List<Topic>> getTopicsCollection() async {
    var result = await TopicsRepository().topicsRef.getDocuments();
    _items = result.documents.map((doc) => Topic.fromDocument(doc)).toList();
    return _items;
  }

  Stream<List<Topic>> streamTopicsByBook(String book) {
    TopicsRepository().topicsRef.where("book", isEqualTo: book).snapshots();
  }
}
