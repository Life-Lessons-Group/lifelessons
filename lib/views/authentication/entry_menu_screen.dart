
import 'package:firebase_flutter_life/routing/route_names.dart';
import 'package:flutter/material.dart';

class EntryMenuScreen extends StatelessWidget {
  const EntryMenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.green[200],
                Colors.lightBlue[200],
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                Text(
                  "life lessons",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 36),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: FlatButton(
                    textColor: Colors.teal[200],
                    color: Colors.white,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterRoute);
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: FlatButton(
                    textColor: Colors.grey[100],
                    color: Colors.transparent,
                    child: Text("Login"),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginRoute);
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
