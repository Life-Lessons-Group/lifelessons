import 'package:firebase_flutter_life/core/screen_dimensions.dart';
import 'package:firebase_flutter_life/services/firebase_user_data_service.dart';
import 'package:firebase_flutter_life/routing/route_names.dart';
import 'package:firebase_flutter_life/views/profile/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';

class LessonBottomSheet extends StatelessWidget {
  final String postID;
  final String userID;
  const LessonBottomSheet({@required this.postID, @required this.userID});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenDimensions(context).screenHeight / 3,
      width: ScreenDimensions(context).screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          // LessonBottomSheetTile(
          //   icon: Icon(Icons.favorite_border),
          //   title: "Add To Favorites",
          //   color: Colors.grey[800],
          //   action: () {},
          // ),
          LessonBottomSheetTile(
              icon: Icon(Icons.account_circle_sharp),
              title: "Go To User Profile",
              color: Colors.grey[800],
              action: () {
                var learnRoute = MaterialPageRoute(
                  builder: (BuildContext context) =>
                      UserProfileScreen(userID: userID),
                );
                Navigator.of(context).push(learnRoute);
              }),

          LessonBottomSheetTile(
            icon: Icon(Icons.lock_open_outlined),
            title: "Grant User Access to Private Book",
            color: Colors.grey[800],
            action: () => UserDatabaseService().grantPrivateBookAccess(userID),
          ),

          // LessonBottomSheetTile(
          //   icon: Icon(
          //     Icons.block,
          //     color: Colors.red,
          //   ),
          //   title: "Report Lesson",
          //   color: Colors.red,
          //   action: () {},
          // ),
          SizedBox(height: 10),
          Container(
            width: ScreenDimensions(context).screenWidth * .9,
            height: ScreenDimensions(context).screenHeight * .055,
            padding: EdgeInsets.all(8),
            child: FlatButton(
                color: Colors.grey[300],
                onPressed: () => Navigator.pop(context),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )),
          )
        ],
      ),
    );
  }

  // LessonBottomSheetTile likedPost(BuildContext context) {
  //   final user = Provider.of<User>(context);

  //   return LessonBottomSheetTile(icon: null, title: null, color: null, action: null)
  // }
}

class LessonBottomSheetTile extends StatelessWidget {
  final Icon icon;
  final String title;
  final Color color;
  final Function action;

  const LessonBottomSheetTile(
      {@required this.icon,
      @required this.title,
      @required this.color,
      @required this.action});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: 10),
      icon,
      FlatButton(
        onPressed: action,
        child: Text(
          title,
          style: TextStyle(
              color: color, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    ]);
  }
}
