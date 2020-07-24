import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';


class UserDatabaseService {
  final String uid;
  UserDatabaseService({this.uid});

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
    "profileImageURL": photoUrl
    });
  }

   // user data from snapshots
  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      
      userID: snapshot['userID'],
      email: snapshot['email'],
      username: snapshot['username'],
      profileImageURL: snapshot['profileImageURL'],
      bio: snapshot['bio'],
      location: snapshot['location'],
    );
  }

    // get user doc stream
  Stream<User> get userData {
    return usersCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}
