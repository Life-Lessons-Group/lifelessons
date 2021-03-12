import 'package:firebase_flutter_life/core/screen_dimensions.dart';
import 'package:firebase_flutter_life/views/discover/selected_book_screen.dart';
import 'package:firebase_flutter_life/routing/route_names.dart';
import 'package:flutter/material.dart';

class ArchivedTopicsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenDimensions(context).screenHeight / 5,
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
                onTap: () {
                  var bookRoute = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        BookScreen(book: "Volume One"),
                  );
                  Navigator.of(context).push(bookRoute);
                },
                title: Text(
                  "Volume 1",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {
                  var bookRoute = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        BookScreen(book: "Volume Two"),
                  );
                  Navigator.of(context).push(bookRoute);
                },
                title: Text(
                  "Volume 2",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {
                  var bookRoute = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        BookScreen(book: "Pandemic"),
                  );
                  Navigator.of(context).push(bookRoute);
                },
                title: Text(
                  "Pandemic",
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
