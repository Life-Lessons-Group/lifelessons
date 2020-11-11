import 'package:firebase_flutter_life/features/timeline/data/models/topic.dart';
import 'package:firebase_flutter_life/features/timeline/data/repositories/topics_repository.dart';
import 'package:flutter/material.dart';

class Topics with ChangeNotifier {
  List<Topic> _topics = [];
  List<Topic> get topics {
    return [..._topics];
  }

  List<Topic> findByBook(String book) {
    return _topics.where((topic) => topic.book == book).toList();
  }

  Stream<List<Topic>> fetchTopics() {
    TopicsRepository().topicsRef.snapshots().map((topics) {
      return _topics =
          topics.documents.map((doc) => Topic.fromDocument(doc)).toList();
    });
  }

  Stream<List<Topic>> fetchTopicsByBook(String book) {
    TopicsRepository()
        .topicsRef
        .where("book", isEqualTo: book)
        .snapshots()
        .map((topics) {
      _topics =
          topics.documents.map((doc) => Topic.fromDocument(doc)).toList();
    });
  }
}
