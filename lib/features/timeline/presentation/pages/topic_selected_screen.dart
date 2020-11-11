import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_life/UI/screens/record_screens/test_record_screen.dart';
import 'package:firebase_flutter_life/features/timeline/data/repositories/posts_repository.dart';
import 'package:firebase_flutter_life/features/timeline/data/models/post_model.dart';
import 'package:firebase_flutter_life/features/timeline/presentation/providers/posts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TopicSelectedScreen extends StatefulWidget {
  final String topic;

  const TopicSelectedScreen({Key key, this.topic}) : super(key: key);

  @override
  _TopicSelectedScreenState createState() => _TopicSelectedScreenState();
}

class _TopicSelectedScreenState extends State<TopicSelectedScreen> {
  List<Post> posts;

  getTimeline(BuildContext ctx) {
    final posts = Provider.of<Posts>(ctx).findByTopic(widget.topic);
    setState(() {
      this.posts = posts;
    });
  }

  buildTimeline() {
    if (posts == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (posts.isEmpty) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.sadTear,
              color: Colors.black26,
            ),
            SizedBox(height: 20),
            Text(
              "There appears to be no lessons on this topic",
              style: TextStyle(color: Colors.black26, fontSize: 16.0),
            ),
            SizedBox(height: 20),
            Text("Record a new lesson today!",
                style: TextStyle(color: Colors.black26, fontSize: 16.0)),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 250,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.indigo[300],
                onPressed: () {
                  var contributeRoute = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TestRecord(topic: widget.topic),
                  );
                  Navigator.of(context).push(contributeRoute);
                },
                child: Text(
                  "Go To Recorder!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return ListView(children: posts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: AutoSizeText(
          widget.topic,
          maxLines: 1,
          style: TextStyle(color: Colors.white),
        ),
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
      ),
      body: RefreshIndicator(
        onRefresh: () => getTimeline(context),
        child: buildTimeline(),
      ),
    );
  }
}
