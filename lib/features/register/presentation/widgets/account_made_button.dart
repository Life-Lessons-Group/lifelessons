
import 'package:firebase_flutter_life/core/AppColors.dart';
import 'package:firebase_flutter_life/routing/route_names.dart';
import 'package:flutter/material.dart';

class AlreadyAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Center(
        child: FlatButton(
          onPressed: () {Navigator.pushNamed(context, LoginRoute);},
          child: Row(
            children: <Widget>[
              Text(
                "Already have an account?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Sign In",
                style: TextStyle(
                    color: AppColors.accessoryColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
