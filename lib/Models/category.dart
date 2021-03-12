import 'package:firebase_flutter_life/features/topics/data/models/topic_model.dart';

class Category {
  final String title;
  final List<Topic> topics;

  Category(this.title, this.topics);
}
