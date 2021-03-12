import 'package:firebase_flutter_life/models/post_model.dart';

import 'book.dart';

class Playlist extends Book {
  bool isPrivate;
  final String userID;
  final DateTime creationDate;

  Playlist(String id, String title, List<Post> posts, this.userID, this.creationDate)
      : super(id, title, posts);
}
