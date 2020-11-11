import 'package:cloud_firestore/cloud_firestore.dart';

class Topic {
  final String title;
  final String book;
  final List<String> categories;

  Topic({this.title, this.book, this.categories});

  factory Topic.fromDocument(DocumentSnapshot doc) {
    return Topic(
      title: doc["title"],
      book: doc["book"],
      categories: doc["categories"],
    );
  }
}
