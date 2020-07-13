import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';


import 'firebase_user_data_service.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersRef = Firestore.instance.collection('users');


  // create user object based on firebase user
  static User userFromFirebaseUser(FirebaseUser user) {
   if (user != null) {
     return User(userID: user.uid);
   }
   print("ERROR: User not found");
   return null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(userFromFirebaseUser);
  }
  
  // sign in anonymously

  // Future signInAnon() async {
  //   try {
  //     AuthResult result await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return user;
  //   } catch(e) {
      
  //   }
  // }


  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String username, String email, String password) async {
    try {
      final AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await UserDatabaseService(uid:user.uid).registerUserInFirestore(user.uid, username, email);
      return userFromFirebaseUser(user);
    } catch(e) {
       print(e.toString());
        return null;
    }
  }

  //sign out 

  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
    }
  }


}