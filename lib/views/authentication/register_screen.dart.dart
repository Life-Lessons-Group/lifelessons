
import 'package:firebase_flutter_life/views/authentication/account_made_button.dart';
import 'package:firebase_flutter_life/views/authentication/register_form.dart';

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Create Account",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Sign up to get started!",
                style: TextStyle(color: Colors.grey[400], fontSize: 24),
              ),
            ),
            RegisterForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            AlreadyAccountButton(),
          ],
        ),
      ),
    );
  }
}
