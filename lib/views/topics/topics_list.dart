import 'package:firebase_flutter_life/models/topic_model.dart';
import 'package:firebase_flutter_life/providers/topics.dart';
import 'package:firebase_flutter_life/views/topics/topics_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topics = Provider.of<List<Topic>>(context);
    return ListView.builder(
        itemCount: topics.length,
        itemBuilder: (ctx, i) => TopicsListItem(
              title: topics[i].title,
            ));
  }
}
