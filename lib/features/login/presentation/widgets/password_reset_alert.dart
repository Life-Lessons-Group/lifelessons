// import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_auth_service.dart';
// import 'package:flutter/material.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

// class PasswordResetAlert extends StatelessWidget {
//   final TextEditingController _textFieldController = TextEditingController();
//   final auth = AuthService();
//   String email;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Alert(
//       context: context,
//       title: "Reset Password",
//       buttons: [
//         DialogButton(
//           child: Text(
//             "Send Reset Link",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//           onPressed: () {
//             auth.resetPassword(email);

//             Scaffold.of(context).showSnackBar(snackBar);
//           },
//           gradient: LinearGradient(
//             colors: <Color>[
//               Colors.green[200],
//               Colors.lightBlue[500],
//             ],
//           ),
//         ),
//       ],
//       content: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             // Text("Private or Public Lesson?", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),),

//             TextFormField(
//               decoration: InputDecoration(labelText: "Email"),
//               onSaved: (val) {
//                 email = val;
//               },
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     ).show();
//   }
// }
