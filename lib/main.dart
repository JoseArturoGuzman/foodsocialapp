import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialfoodapp/components/theme_button.dart';
import 'package:socialfoodapp/food_theme.dart';
import 'package:socialfoodapp/home.dart';
import 'package:socialfoodapp/models/grocery_manager.dart';
import 'package:socialfoodapp/models/tab_manager.dart';

void main() => runApp(FoodSocialApp());

class FoodSocialApp extends StatefulWidget {

  @override
  State<FoodSocialApp> createState() => _FoodSocialAppState();
}

class _FoodSocialAppState extends State<FoodSocialApp> {
  ThemeData theme = FoodTheme.light();

  void changeThemeMode(bool isLightMode){
    setState(() {
      if(isLightMode){
        theme = FoodTheme.light();
      }else{
        theme = FoodTheme.dark();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    const appTitle = 'Food Social App';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: appTitle,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager(),),
          ChangeNotifierProvider(create: (context) => GroceryManager(),),
        ],
          child: Home(appTitle: appTitle,
            changeThemeMode: changeThemeMode,)),
    );
  }
}
