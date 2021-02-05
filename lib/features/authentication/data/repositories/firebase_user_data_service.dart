import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_life/features/authentication/data/datasources/firebase_user.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/topics/data/datasources/firebase_collections.dart';
import 'package:firebase_flutter_life/models/private_post_model.dart';
import 'package:flutter/material.dart';

class UserDatabaseService with ChangeNotifier {
  final String uid;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _postCount;
  int _followerCount;
  int _followingCount;
  String _currentUserID;
  User _userDoc;
  bool _isAccessGranted;

  get isAccessGranted {
    return _isAccessGranted;
  }

  get userDoc {
    return _userDoc;
  }

  get currentUserID {
    return _currentUserID;
  }

  get postCount {
    return _postCount;
  }

  get followerCount {
    return _followerCount;
  }

  get followingCount {
    return _followingCount;
  }

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
    usersCollection.document(uid).setData({"profileImageURL": photoUrl});
  }

  Future<void> getMemberAccess(String userID) async {
    var currentUser = await _auth.currentUser();

    var doc = await FirebaseCollections.userCollectionReference
        .document(userID)
        .get();
    Map memberAccess = doc.data["memberAccess"];
    if (memberAccess.containsKey(currentUser.uid)) {
      _isAccessGranted = true;
    } else {
      _isAccessGranted = false;
    }
    notifyListeners();
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
      memberAccess: snapshot["memberAccess"],
    );
  }

  // get user doc stream
  Stream<User> get userData {
    return usersCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  Future grantPrivateBookAccess(String userID) async {
    var currentUser = await _auth.currentUser();
    usersCollection.document(currentUser.uid).updateData({
      "memberAccess": {
        userID: true,
      }
    });
  }

  Future<User> getUserByID(String userID) async {
    var snapshot = await usersCollection.document(userID).get();
    return User.fromMap(snapshot.data);
  }

  getFollowers() async {
    QuerySnapshot snapshot = await FirebaseDataSource.followersRef
        .document(uid)
        .collection('userFollowers')
        .getDocuments();

    _followerCount = snapshot.documents.length;
    notifyListeners();
  }

//GET FOLLOWERS
  getFollowing() async {
    QuerySnapshot snapshot = await FirebaseDataSource.followingRef
        .document(uid)
        .collection('userFollowing')
        .getDocuments();

    _followingCount = snapshot.documents.length;
    notifyListeners();
  }

//POST COUNT
  getPostCount() async {
    QuerySnapshot snapshot = await FirebaseCollections.postsCollectionReference
        .where("uid", isEqualTo: uid)
        .getDocuments();

    _postCount = snapshot.documents.length;
  }

  void getCurrentUser() async {
    var currentUser = await _auth.currentUser();
    _currentUserID = currentUser.uid;
    notifyListeners();
  }

  //   getPrivatePosts() async {
  //   final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  //   QuerySnapshot snapshot = await FirebaseCollections.privateCollectionReference
  //       .document(user.uid)
  //       .collection("privateUserPosts")
  //       .getDocuments();
  //   List<PrivatePost> posts =
  //       snapshot.documents.map((doc) => PrivatePost.fromDocument(doc)).toList();
  //   setState(() {
  //     this.posts = posts;
  //   });
  // }
}
