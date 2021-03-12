import 'package:firebase_flutter_life/core/screen_dimensions.dart';
import 'package:firebase_flutter_life/views/discover/selected_category_screen.dart';
import 'package:flutter/material.dart';

class DiscoverCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenDimensions(context).screenHeight / 3,
      width: ScreenDimensions(context).screenWidth,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        // gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: <Color>[
        //       Colors.lightGreen[200],
        //       Colors.lightBlue[600],
        //     ]),
      ),
      child: ListView(
        children: ListTile.divideTiles(
            context: context,
            color: Colors.white.withOpacity(0.6),
            tiles: [
              ListTile(
                // onTap: () {
                //   var categoryRoute = MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         CategoryScreen(category: "Business & Career"),
                //   );
                //   Navigator.of(context).push(categoryRoute);
                // },
                title: Text(
                  "Business & Career",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              ListTile(
                // onTap: () {
                //   var categoryRoute = MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         CategoryScreen(category: "Religion & Spirituality"),
                //   );
                //   Navigator.of(context).push(categoryRoute);
                // },
                title: Text(
                  "Religion & Spirituality",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              ListTile(
                // onTap: () {
                //   var categoryRoute = MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         CategoryScreen(category: "Family & Friends"),
                //   );
                //   Navigator.of(context).push(categoryRoute);
                // },
                title: Text(
                  "Family & Friends",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              ListTile(
                // onTap: () {
                //   var categoryRoute = MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         CategoryScreen(category: "Love & Relationships"),
                //   );
                //   Navigator.of(context).push(categoryRoute);
                // },
                title: Text(
                  "Love & Relationships",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              ListTile(
                // onTap: () {
                //   var categoryRoute = MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         CategoryScreen(category: "Health & Wellness"),
                //   );
                //   Navigator.of(context).push(categoryRoute);
                // },
                title: Text(
                  "Health & Wellness",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
            ]).toList(),
      ),
    );
  }
}
