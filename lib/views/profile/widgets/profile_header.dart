// import 'package:firebase_flutter_life/Models/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProfileHeader extends StatelessWidget {
  

//   @override
//   Widget build(BuildContext context) {
//    final user = Provider.of<User>(context);
//     return Container(
//       height: 320,
//       width: double.infinity,
//       child: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(60),
//                 bottomRight: Radius.circular(60),
//               ),
//               gradient: LinearGradient(
//                 begin: Alignment.bottomRight,
//                 end: Alignment.topLeft,
//                 colors: <Color>[
//                   Colors.lightGreen[200],
//                   Colors.lightBlue[600],
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     IconButton(
//                       icon: Icon(Icons.inbox),
//                       color: Colors.transparent,
//                       onPressed: () {},
//                     ),
//                     Text(
//                       "Your Book",
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w300),
//                     ),
//                     AppDrawerButton(),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 CircleAvatar(
//                   radius: 40.0,
//                   backgroundColor: Colors.grey,
//                   // backgroundImage: (user.profileImageUrl),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   user.username,
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//                 SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(
//                       Icons.location_on,
//                       color: Colors.white70,
//                       size: 12,
//                     ),
//                     Text("Washington, D.C.",
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w300)),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         Text(
//                           followerCount.toString(),
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Audience",
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w300),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: <Widget>[
//                         Text(
//                           followingCount.toString(),
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Classmates",
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w300),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: <Widget>[
//                         Text(
//                           postCount.toString(),
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Lessons",
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w300),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//     );
//   }
// }