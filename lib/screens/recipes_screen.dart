import 'package:flutter/material.dart';
import 'package:socialfoodapp/api/api_service.dart';
import 'package:socialfoodapp/components/card2.dart';
import 'package:socialfoodapp/models/simple_recipe.dart';

import '../components/recipe_thubmnail.dart';

class RecipesScreen extends StatelessWidget {
   RecipesScreen({super.key});
  final apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    //return Card2();

    return FutureBuilder(
      future: apiService.getRecipes(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return RecipesGrid(recipes: snapshot.data ??[]);
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }

      },
    );
  }
}

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({super.key, required this.recipes});
  final List<SimpleRecipe> recipes;
  @override
  Widget build(BuildContext context) {
    return
      GridView.builder(
        itemCount: recipes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            final simpleRecipe = recipes[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RecipeThumbnail(simpleRecipe: simpleRecipe),
            );
          },
      );
  }
}

