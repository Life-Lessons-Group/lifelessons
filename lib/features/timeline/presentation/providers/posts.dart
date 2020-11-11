import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_life/features/timeline/data/models/post_model.dart';
import 'package:firebase_flutter_life/features/timeline/data/repositories/posts_repository.dart';
import 'package:flutter/widgets.dart';

class Posts with ChangeNotifier {

  List<Post> _posts = [];
  List<Post> get posts {
    return [..._posts];
  }

  List<Post> findByTopic(String topic) {
    return _posts.where((post) => post.lessonTopic == topic);
  }

  fetchPosts() {
    PostRepository().postsRef.snapshots().listen((posts) {
      _posts = posts.documents.map((doc) => Post.fromDocument(doc));
      notifyListeners();
    });
  }
}
