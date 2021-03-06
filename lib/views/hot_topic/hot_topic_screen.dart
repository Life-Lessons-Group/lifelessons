import 'package:auto_size_text/auto_size_text.dart';

import 'package:firebase_flutter_life/core/size_config.dart';
import 'package:firebase_flutter_life/views/hot_topic/hot_topic_countdown_timer.dart';
import 'package:firebase_flutter_life/views/hot_topic/hot_topic_post_list.dart';
import 'package:firebase_flutter_life/services/shared_prefs.dart';
import 'package:firebase_flutter_life/views/record/hot_topic_record.dart';
import 'package:firebase_flutter_life/views/record/test_record_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:showcaseview/showcaseview.dart';

import '../../models/hot_topic_model.dart';
import '../../providers/posts.dart';

class HotTopicScreen extends StatefulWidget {
  const HotTopicScreen({Key key}) : super(key: key);

  @override
  _HotTopicScreenState createState() => _HotTopicScreenState();
}

class _HotTopicScreenState extends State<HotTopicScreen> {
  final _hotTopicKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SharedPrefs.isFirstVisit("hotTopicScreenVisit").then((result) {
        if (result) ShowCaseWidget.of(context).startShowCase([_hotTopicKey]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var topic = Provider.of<HotTopic>(context);
    return StreamProvider.value(
      value: Posts().getHotPost(topic),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
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
          title: Showcase(
            title: "History doesn’t have to repeat itself!",
            description:
                'Here, share your insight to help shape\na different outcome for a better tomorrow',
            key: _hotTopicKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "hot topic 🔥",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
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
          onPressed: () {
            var learnRoute = MaterialPageRoute(
              builder: (BuildContext context) =>
                  HotTopicRecord(topic: topic),
            );
            Navigator.of(context).push(learnRoute);
          },
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.lightBlueAccent])),
          child: Column(
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
                    child: AutoSizeText(
                      topic.title,
                      maxFontSize: 20,
                      minFontSize: 12,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
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
                child: HotTopicCountDownTimer(endDate: topic.endDate.toDate()),
              ),
              SizedBox(height: 10),
              Expanded(child: HotTopicPostList()),
            ],
          ),
        ),
      ),
    );
  }
}
