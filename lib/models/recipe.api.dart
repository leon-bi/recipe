import 'dart:convert';
import 'package:recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {'limit': '24', 'start': '0'});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '41cd718136msh55e37f744b1a5a0p1ca7d2jsn86aa403284eb',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      // get the data of contents and details key
      temp.add(i['content']['details']);
    }
// return recipeSnapshotfucnction that takes in _temp list
    return Recipe.recipesFromSnapshot(temp);
  }
}
