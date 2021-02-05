// import 'package:flutter/material.dart';

// class ProfileHeader extends StatefulWidget {
//   final postCount = 0;
//   final followerCount = 0;
//   final followingCount = 0;
  
//   ProfileHeader({Key key, this.username}) : super(key: key);

//   @override
//   _ProfileHeaderState createState() => _ProfileHeaderState();
// }

// class _ProfileHeaderState extends State<ProfileHeader> {
//   @override
//   Widget build(BuildContext context) {
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
//                       icon: Icon(Icons.nat),
//                       color: Colors.transparent,
//                       onPressed: () {},
//                     ),
//                     Text(
//                       "your book",
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w800),
//                     ),
//                     AppDrawerButton(),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: () => getImage(),
//                   child: Stack(
//                     children: <Widget>[
//                       CircleAvatar(
//                         radius: 40.0,
//                         backgroundImage: widget.user.profileImageURL != null
//                             ? NetworkImage(widget.user.profileImageURL)
//                             : AssetImage('assets/images/logo.jpeg'),
//                       ),
//                       Positioned(
//                         child: Icon(
//                           Icons.add_a_photo,
//                           color: Colors.grey[600],
//                         ),
//                         bottom: 1,
//                         right: 1,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   widget.user.username,
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
//                     Text("United States",
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
//                           widget.followerCount.toString(),
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
//                           widget.followingCount.toString(),
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
//                           widget.postCount.toString(),
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
//   }
// }
