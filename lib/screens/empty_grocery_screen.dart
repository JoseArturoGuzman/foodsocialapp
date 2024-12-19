import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialfoodapp/models/tab_manager.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset("assets/grocery_pics/empty_list.png"),
          ),
        ),
        Text(
          "No grocery",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Shopping for ingridients\nTap the + button to write them down",
          textAlign: TextAlign.center,
        ),
        MaterialButton(
          onPressed: () {
            Provider.of<TabManager>(context, listen: false).goToRecipes();
          },
          color: Colors.green,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text("Browse Recipes"),
        )
      ],
    );
  }
}
