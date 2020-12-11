import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/archived_topics.dart';

class ArchivedTopicsScreen extends StatelessWidget {
  static const routeName = '/archived';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: <Color>[
            Colors.lightGreen[200],
            Colors.lightBlue[600],
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: Text(
                "pandemic life lessons",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            body: ArchivedTopics(),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.greenAccent.withOpacity(0.4), BlendMode.darken),
                  image: AssetImage('images/logo_screen_shot.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTopicScreenUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Container(
        height: 70,
        width: 70,
      ),
    );
  }
}
