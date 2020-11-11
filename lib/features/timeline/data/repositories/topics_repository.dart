import 'package:cloud_firestore/cloud_firestore.dart';

class TopicsRepository {
  final CollectionReference topicsRef = Firestore.instance.collection("topics");
}
