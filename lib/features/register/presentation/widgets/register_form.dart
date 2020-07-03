import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_life/Pickers/user_image_picker.dart';
import 'package:firebase_flutter_life/Services/firebase_service.dart';
import 'package:firebase_flutter_life/UI/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterForm extends StatefulWidget {
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String username = "";
  String email = "";
  String password = "";
  String error = "";
  File _userImageFile;
  bool isLoading = false;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                UserImagePicker(_pickedImage),
                TextFormField(
                  validator: (val) => val.isEmpty || val.length < 6
                      ? "Username must be 6 or more characters."
                      : null,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Username',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) {
                    username = val;
                  },
                ),
                TextFormField(
                  validator: (val) => val.isEmpty || !val.contains('@')
                      ? "Please enter a valid email."
                      : null,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Your Email Address',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) {
                    email = val;
                  },
                ),
                TextFormField(
                  validator: (val) => val.isEmpty || val.length < 6
                      ? "Password must be 6 or more characters."
                      : null,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  onSaved: (val) {
                    password = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        if (_userImageFile == null) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please pick an image.'),
                              backgroundColor: Theme.of(context).errorColor,
                            ),
                          );
                        }
                        setState(() => isLoading = true);
                        dynamic result =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (result == null) {
                          setState(() => isLoading = false);
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Uh oh, something went wrong."),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    child: Text("Register"),
                  ),
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  child: Text("Already Have an Account?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
