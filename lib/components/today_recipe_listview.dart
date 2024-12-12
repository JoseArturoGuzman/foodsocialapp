import 'package:flutter/material.dart';
import 'package:socialfoodapp/components/card1.dart';
import 'package:socialfoodapp/models/explore_recipe.dart';

import 'card2.dart';
import 'card3.dart';

class TodayRecipeListview extends StatelessWidget {
  const TodayRecipeListview({super.key, required this.recipes});

  final List<ExploreRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Recipes of The Day 🔍',
        style: Theme.of(context).textTheme.displayLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
              itemCount: recipes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 16,);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == CardTypes.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == CardTypes.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == CardTypes.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception("This Card does not exists");
    }
  }
}
