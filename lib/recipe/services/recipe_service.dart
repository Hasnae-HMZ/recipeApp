import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import '../domain/recipe.dart';
// import 'firebase_options.dart';

class RecipeService {
  final Dio _dio = Dio();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Recipe>> getYummlyRecipes() async {
    List<Recipe> yummlyRecipes = [];
    var response = await _dio
        .get("https://api.yummly.com/v1/api/recipes", queryParameters: {
      "_app_id": "4999742",
      "_app_key": "b946cf9440msh0d337bd05f37ea0p162782jsn7bcd154b4079",
      "q": "chicken", // Recherche de recettes de poulet
      "allowedIngredient[]": ["onion", "garlic"], // Ingrédients autorisés
      "excludedIngredient[]": ["dairy"], // Ingrédients exclus
      "maxResult": 10, // Nombre maximal de résultats
    });
    var data = response.data;
    for (var item in data) {
      yummlyRecipes.add(Recipe.fromJson(item));
    }
    // print(yummlyRecipes);
    return yummlyRecipes;
  }

  Future<List<Recipe>> getSaved({required String userId}) async {
    List<Recipe> recipes = [];
    var response = await _firestore
        .collection("users")
        .doc(userId)
        .collection("saved")
        .get();
    var docs = response.docs;
    for (var doc in docs) {
      recipes.add(Recipe.fromJson(doc.data()));
    }
    return recipes;
  }

  Future save ({required Recipe recipe, required String userId}) async {
    _firestore.collection("users").doc(userId).collection("saved").doc(recipe.id).set(recipe.toJson());
  }

  Future unsave ({required String recipeId, required String userId }) async {
    _firestore.collection("users").doc(userId).collection("saved").doc(recipeId).delete();
  }

  // favorite methode

  Future<List<Recipe>> getFavorites({required String userId}) async {
    List<Recipe> favoriteRecipes = [];
    var response = await _firestore
        .collection("users")
        .doc(userId)
        .collection("favorites")
        .get();
    var docs = response.docs;
    for (var doc in docs) {
      favoriteRecipes.add(Recipe.fromJson(doc.data()));
    }
    return favoriteRecipes;
  }

  Future addToFavorites(
      {required Recipe recipe, required String userId}) async {
    _firestore
        .collection("users")
        .doc(userId)
        .collection("favorites")
        .doc(recipe.id)
        .set(recipe.toJson());
  }

  Future removeFromFavorites(
      {required String recipeId, required String userId}) async {
    _firestore
        .collection("users")
        .doc(userId)
        .collection("favorites")
        .doc(recipeId)
        .delete();
  }

}
