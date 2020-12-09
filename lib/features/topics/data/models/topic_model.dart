import 'package:cloud_firestore/cloud_firestore.dart';

class Topic {
  final String title;
  final String book;
  final List<String> categories;

  Topic({this.title, this.book, this.categories});

  factory Topic.fromMap(Map data) {
    return Topic(
      title: data["title"],
      book: data["book"],
      categories: data["categories"] ?? [],
    );
  }
}
