import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  Future registerUserInFirestore(
      String userID, String username, String email) async {
      usersCollection.document(uid).setData({
      "username": username,
      "email": email,
      "userID": userID, 
    });
  }

  Future updateUserPhoto(String photoUrl) async {
    usersCollection.document(uid).setData({
    "profileImageUrl": photoUrl
    });
  }
}
