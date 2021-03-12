
import 'package:firebase_flutter_life/models/topic_model.dart';
import 'package:firebase_flutter_life/providers/topics.dart';
import 'package:firebase_flutter_life/views/topics/topics_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicsList extends StatefulWidget {
  final String book;

  const TopicsList({this.book});

  @override
  _TopicsListState createState() => _TopicsListState();
}

class _TopicsListState extends State<TopicsList> {
  Future _getTopics;

  @override
  void initState() {
    _getTopics = Topics().getTopicsByBook(widget.book);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getTopics,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        List<Topic> topics = snapshot.data;
        Widget child;
        if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            child = Container(
              key: ValueKey(0),
            );
          } else {
            child = ListView.builder(
              key: ValueKey(1),
              itemCount: topics.length,
              itemBuilder: (ctx, i) => TopicsListItem(
                title: topics[i].title,
              ),
            );
          }
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: child,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
