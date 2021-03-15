import 'package:cloud_firestore/cloud_firestore.dart';

import '../features/topics/data/datasources/../../../../data/firebase_paths.dart';

class FirebaseCollections {
  static final topicsCollectionReference =
      Firestore.instance.collection(FirebasePaths.topicsPath);
  static final postsCollectionReference =
      Firestore.instance.collection(FirebasePaths.postsPath);
        static final hotTopicCollectionReference =
      Firestore.instance.collection(FirebasePaths.hotTopicsPath);
  static final favoritesCollectionReference =
      Firestore.instance.collection(FirebasePaths.favoritesPath);
  static final privateCollectionReference =
      Firestore.instance.collection(FirebasePaths.privatePath);
  static final userCollectionReference =
      Firestore.instance.collection(FirebasePaths.usersPath);
}
