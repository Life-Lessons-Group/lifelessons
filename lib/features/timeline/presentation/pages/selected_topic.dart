
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';

import 'package:firebase_flutter_life/features/timeline/presentation/widgets/post_list.dart';
import 'package:flutter/material.dart';


class SelectedTopicScreen extends StatelessWidget {
  final User user;
  final String topic;

  SelectedTopicScreen({Key key, this.user, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(topic)),
      body: PostList(),
    );
  }
}
