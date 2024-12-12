import 'package:flutter/material.dart';
import 'package:socialfoodapp/components/card1.dart';
import 'package:socialfoodapp/components/post_cards.dart';
import 'package:socialfoodapp/models/explore_recipe.dart';

import '../models/post.dart';
import 'card2.dart';
import 'card3.dart';

class FriendPostListView extends StatelessWidget {
  const FriendPostListView({super.key, required this.friendPosts});

  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Social Chefs 🔍',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Container(

          color: Colors.transparent,
          child: ListView.separated(
            itemCount: friendPosts.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              final friendPost = friendPosts[index];
              return PostCards(post: friendPost,);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16,);
            },
          ),
        )
      ],
    );
  }
}
