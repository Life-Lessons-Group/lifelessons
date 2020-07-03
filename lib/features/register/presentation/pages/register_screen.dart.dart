import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Text("Create Account,", style: TextStyle(color: Colors.black, fontSize: 24),),
          Text("Sign up to get started!", style: TextStyle(color: Colors.grey[300], fontSize: 20), ),
        ],
      ),
    );
  }
}
