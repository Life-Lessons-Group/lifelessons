import 'package:firebase_flutter_life/core/AppColors.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_auth_service.dart';
import 'package:firebase_flutter_life/features/login/presentation/widgets/login_form.dart';
import 'package:firebase_flutter_life/features/register/presentation/pages/register_screen.dart.dart';
import 'package:firebase_flutter_life/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';
  final auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Welcome,",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Sign in to continue!",
                style: TextStyle(color: Colors.grey[400], fontSize: 24),
              ),
            ),
            LoginForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("I already have an account.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context)
          .pushNamedAndRemoveUntil(RegisterRoute, (Route<dynamic> route) => false);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: AppColors.accessoryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            FlatButton(
              onPressed: () {
                return Alert(
                  context: context,
                  title: "Reset Password",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Send Reset Link",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      onPressed: () {
                        auth.resetPassword(email);
                        Navigator.of(context)
          .pushNamedAndRemoveUntil(WalkThroughRoute, (Route<dynamic> route) => false);
                      },
                      gradient: LinearGradient(
                        colors: <Color>[
                          AppColors.gradientGreen,
                          AppColors.gradientBlue
                        ],
                      ),
                    ),
                  ],
                  content: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // Text("Private or Public Lesson?", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),),

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          enableSuggestions: false,
                          decoration: InputDecoration(labelText: "Email"),
                          onSaved: (val) {
                            email = val;
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ).show();
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
