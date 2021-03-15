import 'package:cloud_firestore/cloud_firestore.dart';

class HotTopic {
  final String title;
  final String id;
  final Timestamp endDate;

  HotTopic({this.title, this.endDate, this.id});

  factory HotTopic.fromMap(Map data) {
    return HotTopic(
      title: data["title"],
      id: data["id"],
      endDate: data["endDate"],
    );
  }
}
