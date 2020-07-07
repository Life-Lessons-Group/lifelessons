import 'package:firebase_flutter_life/core/AppColors.dart';
import 'package:firebase_flutter_life/features/register/presentation/widgets/account_made_button.dart';
import 'package:firebase_flutter_life/features/register/presentation/widgets/facebook_button.dart';
import 'package:firebase_flutter_life/features/register/presentation/widgets/register_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = "/register-screen";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.15,
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.accessoryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]),
                ),
                hintText: 'Username',
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.15,
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.accessoryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]),
                ),
                hintText: 'Email',
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.15,
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.accessoryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]),
                ),
                hintText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          RegisterButton(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          FaceBookButton(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          AlreadyAccountButton(),
        ],
      ),
    );
  }
}
