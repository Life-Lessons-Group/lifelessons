import 'package:firebase_flutter_life/core/size_config.dart';
import 'package:firebase_flutter_life/features/hot_topic/presentation/widgets/hot_topic_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotTopicScreen extends StatelessWidget {
  const HotTopicScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.lightGreen[200],
                  Colors.lightBlue[600],
                ]),
          ),
        ),
        centerTitle: true,
        title: Text(
          "hot topic 🔥",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.microphoneAlt,
              size: 40,
            ),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.lightGreen[200],
                    Colors.lightBlue[600],
                  ])),
        ),
        onPressed: () {},
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.darken),
                image: AssetImage('assets/images/hot_topic_leadership.jpg'),
              ),
              // gradient: LinearGradient(
              //   begin: Alignment.bottomRight,
              //   end: Alignment.topLeft,
              //   colors: <Color>[
              //     Colors.lightGreen[200],
              //     Colors.lightBlue[600],
              //   ],
              // ),
            ), //custom hot topic design theme background
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "In a great leader, have you seen more honesty or bravery?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.lightGreen[200],
                    Colors.lightBlue[600],
                  ]),
            ),
            child: HotTopicCountDownTimer(),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 25.0, backgroundColor: Colors.red),
                      title: Text("Lesson Title"),
                      subtitle: Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 25.0, backgroundColor: Colors.red),
                      title: Text("Lesson Title"),
                      subtitle: Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 25.0, backgroundColor: Colors.red),
                      title: Text("Lesson Title"),
                      subtitle: Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
