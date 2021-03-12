import 'package:firebase_flutter_life/views/page_loading.dart';
import 'package:firebase_flutter_life/models/post_model.dart';
import 'package:firebase_flutter_life/providers/posts.dart';
import 'package:firebase_flutter_life/views/posts/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Post> posts = Provider.of<List<Post>>(context);

    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (ctx, i) {
          return PostTile();
        });
  }
}
