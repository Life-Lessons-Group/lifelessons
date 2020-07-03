import 'package:flutter/material.dart';

class EntryMenuScreen extends StatelessWidget {
  const EntryMenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green[200],
            Colors.lightBlue[200],
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 6),
            Text(
              "life lessons",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 6),
            SizedBox(
              height: 40,
              width: 60,
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.black12,
                child: Text("Sign Up"),
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
                SizedBox(
              height: 40,
              width: 60,
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.black12,
                child: Text("Sign Up"),
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}
