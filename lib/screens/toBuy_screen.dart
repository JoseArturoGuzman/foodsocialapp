import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialfoodapp/components/card3.dart';
import 'package:socialfoodapp/models/grocery_manager.dart';
import 'package:socialfoodapp/screens/empty_grocery_screen.dart';

class ToBuyScreen extends StatelessWidget {
  const ToBuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {

      },
        child: Icon(Icons.add, color: Colors.white,), ),

      body: buildGroceryScreen(),
    );

    return buildGroceryScreen();
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if(manager.groceryItem.isNotEmpty){
          return Container();
        }else{
          return EmptyGroceryScreen();
        }
      },
    );
  }
}