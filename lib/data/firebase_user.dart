import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataSource {
  static final CollectionReference usersCollection = Firestore.instance
      .collection('users'); //Firebase Authenticated Users Data Source

  static final followersRef = Firestore.instance
      .collection('followers'); //Firebase Users' Followers Data Source

  static final followingRef = Firestore.instance
      .collection('following'); //Firebase Users' Following Data Source



}
