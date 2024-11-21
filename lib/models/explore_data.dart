

import 'package:socialfoodapp/models/explore_recipe.dart';
import 'package:socialfoodapp/models/post.dart';

class ExploreData{
  final List<ExploreRecipe> todayRecipes;
  final List<Post> friendPosts;

  ExploreData(
      this.todayRecipes,
      this.friendPosts
      );
}