import 'package:firebase_flutter_life/views/topics/topics_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/topic_model.dart';
import '../../providers/topics.dart';

class BookScreen extends StatelessWidget {
  final String book;

  const BookScreen({Key key, this.book}) : super(key: key);


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
      child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: Text(
              book,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                  child: StreamProvider<List<Topic>>.value(
                    value: TopicsProvider().getTopicsByBookStream(book),
                                      child: TopicsList(
                
              ),
                  )),
            ],
          )),
    );
  }
}
