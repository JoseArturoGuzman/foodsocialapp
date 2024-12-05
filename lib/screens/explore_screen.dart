import 'package:flutter/material.dart';
import 'package:socialfoodapp/api/api_service.dart';
import 'package:socialfoodapp/components/card1.dart';
import 'package:socialfoodapp/components/today_recipe_listview.dart';

import '../components/friend_post_list_view.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  //Instanciar un objeto
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    //return Center(
    //  child: Card1(),
    //);

    return FutureBuilder(
      future: apiService.getExploreData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListview(recipes: snapshot.data?.todayRecipes ?? []),
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
