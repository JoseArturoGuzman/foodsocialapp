import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:socialfoodapp/models/explore_data.dart';
import 'package:socialfoodapp/models/explore_recipe.dart';
import 'package:socialfoodapp/models/post.dart';
import 'package:socialfoodapp/models/simple_recipe.dart';

class ApiService{

  //Cargar una data desde un archivo (json)
  Future<String> _loadAssets(String path) async{
    return rootBundle.loadString(path);
  }

  //Obtener una lista de sample recipes para mostrar en la aplicacion
  Future<List<SimpleRecipe>> getRecipes() async{
    //Simular una consulta a un api
    await Future.delayed(Duration(microseconds: 1000));
    //Treamos el Json desde nuestro archivo
    final data = await _loadAssets('assets/sample_data/sample_recipes.json');
    //Convertimos el Json a un mapa
    final Map<String, dynamic> json = jsonDecode(data);

    //navegamos en el mapa de recipes y convertimos a objetos de tipo SimpleRecipes
    if(json["recipes"] != null){
      final recipes = <SimpleRecipe>[];
      json["recipes"].forEach((value){
        recipes.add(SimpleRecipe.fromJson(value));
      });

      return recipes; //Devolvemos la lista de objetos SimpleRecipe
    }else{
      return []; //Retornamos una lista vacia
    }
  }

  //Obtener una lista de posts para mostrar en la aplicacion
  Future<List<Post>> _getFriendPosts() async{
    //Simular una consulta a un api
    await Future.delayed(Duration(microseconds: 1000));
    //Treamos el Json desde nuestro archivo
    final data = await _loadAssets('assets/sample_data/sample_friends_feed.json');
    //Convertimos el Json a un mapa
    final Map<String, dynamic> json = jsonDecode(data);

    //navegamos en el mapa de posts y convertimos a objetos de tipo Post
    if(json["feed"] != null){
      final posts = <Post>[];
      json["feed"].forEach((value){
        posts.add(Post.fromJson(value));
      });

      return posts; //Devolvemos la lista de objetos Post
    }else{
      return []; //Retornamos una lista vacia
    }
  }

  //Obtener las recetas a recomendar en un dia
Future<List<ExploreRecipe>> _getTodayRecipes() async {
    await Future.delayed(Duration(milliseconds: 1000));
    final data = await _loadAssets('assets/sample_data/sample_explore_recipes.json');
    final Map<String, dynamic> json = jsonDecode(data);

    if(json["recipes"] == null){
      return [];
    }

    final recipes = <ExploreRecipe>[];
    json["recipes"].forEach((value){
      recipes.add(ExploreRecipe.fromJson(value));
    });
    
    return recipes;
}

//Obtener las listas de Recetas del dia (ExploreRecipe) y de Post

Future<ExploreData> getExploreData() async{
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendPosts();

    return ExploreData(todayRecipes, friendPosts);
}

}