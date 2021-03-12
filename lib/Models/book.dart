import 'package:firebase_flutter_life/models/post_model.dart';

class Book {
  final String id;
  final String title;
  final List<Post> posts;

  Book(this.id, this.title, this.posts);
}
