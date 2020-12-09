import 'package:cloud_firestore/cloud_firestore.dart';

class HotTopic {
  final String topicTitle;

  final Timestamp endDate;

  HotTopic({this.topicTitle, this.endDate});

  factory HotTopic.fromMap(Map data) {
    return HotTopic(
      topicTitle: data["title"],
      endDate: data["endDate"],
    );
  }
}
