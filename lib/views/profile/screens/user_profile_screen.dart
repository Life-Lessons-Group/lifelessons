import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_user_data_service.dart';
import 'package:firebase_flutter_life/views/profile/screens/user_profile_header.dart';
import 'package:firebase_flutter_life/views/profile/widgets/book_tab.dart';
import 'package:firebase_flutter_life/views/profile/widgets/user_book_tab.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfileScreen extends StatelessWidget {
  final String userID;

  const UserProfileScreen({this.userID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: UserDatabaseService(uid: userID).userData,
          builder: (context, snapshot) {
            User user = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Container(
              color: Colors.white24,
              child: Column(
                children: <Widget>[
                  UserProfileHeader(
                    user: user,
                  ),
                  SizedBox(height: 10),
                  UserBookTab(user: user),
                ],
              ),
            );
          }),
    );
  }
}
