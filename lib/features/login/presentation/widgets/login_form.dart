import 'package:firebase_flutter_life/UI/screens/screens.dart';
import 'package:firebase_flutter_life/core/AppColors.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_auth_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginForm extends StatefulWidget {
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  bool isLoading = false;

  void _trySubmit(BuildContext context) async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus(); // gets rid of keyboard on submit
    if (isValid) {
      _formKey.currentState.save();
    }
    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
    if (result == null) {
      setState(() {
        error = "Invalid Email or Password.";
        isLoading = false;
      });

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.accessoryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => val.isEmpty || !val.contains('@')
                        ? "Please enter a valid email."
                        : null,
                    autocorrect: false,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.accessoryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  validator: (val) => val.isEmpty || val.length < 6
                      ? "Password must be 6 or more characters."
                      : null,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Container(
                  width: 250,
                  height: 50,
                  child: isLoading
                      ? SpinKitChasingDots(
                          color: AppColors.accessoryColor,
                        )
                      : RaisedButton(
                          onPressed: () async {
                            setState(() => isLoading = true);
                            _trySubmit(context);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.gradientGreen,
                                    AppColors.gradientBlue
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 1.25,
                                  minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
