import 'package:firebase_flutter_life/features/authentication/presentation/pages/page_loading.dart';
import 'package:firebase_flutter_life/features/posts/data/models/post_model.dart';
import 'package:firebase_flutter_life/features/posts/presentation/provider/posts.dart';
import 'package:firebase_flutter_life/features/posts/presentation/widgets/post_tile.dart';
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
