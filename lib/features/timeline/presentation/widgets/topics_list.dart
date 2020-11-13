
import 'package:firebase_flutter_life/features/timeline/presentation/providers/topics.dart';
import 'package:firebase_flutter_life/features/timeline/presentation/widgets/topics_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topics = Provider.of<Topics>(context);
    final topicsData = topics.items;

    return ListView.builder(
        itemCount: topicsData.length,
        itemBuilder: (ctx, i) => TopicsListItem(
              title: topicsData[i].title,
            ));
  }
}
