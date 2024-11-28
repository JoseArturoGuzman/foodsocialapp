import 'package:flutter/material.dart';
import 'package:socialfoodapp/food_theme.dart';
import 'package:socialfoodapp/models/explore_recipe.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key, required this.recipe});
  
  final String category = 'Editor\'s Choice';
  final String title = 'Art of Dought';
  final String description = 'Learn to make a Choice';
  final String chef = 'Ray Wenderlinch';

  final ExploreRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(
          width: 350,
          height: 350
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Stack(
          children: [
            Text(recipe.cardType, style: FoodTheme.darkTextTheme.bodyLarge),
            Positioned(
              top: 20,
                child: Text(recipe.title, style: FoodTheme.darkTextTheme.titleLarge)
            ),
            Positioned(
              bottom: 30,
                right: 0,
                child: Text(recipe.description, style: FoodTheme.darkTextTheme.bodyLarge)
            ),
            Positioned(
                bottom: 10,
                right: 0,
                child: Text(recipe.authorName, style: FoodTheme.darkTextTheme.bodyLarge)
            ),
          ],
        ),
      ),
    );
  }
}
