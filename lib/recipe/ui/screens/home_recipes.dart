import 'package:flutter/material.dart';
import '../../domain/recipe.dart';
import 'package:recipes/recipe/services/recipe_service.dart';



class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => RecipeListScreenState();
}

class RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [];
    RecipeService recipeService = RecipeService(); // Créez une instance de RecipeService

  @override
  void initState() {
    super.initState();
    fetchYummlyRecipes();
  }

  Future<void> fetchYummlyRecipes() async {
    List<Recipe> yummlyRecipes = await recipeService.getYummlyRecipes();
    setState(() {
      recipes = yummlyRecipes;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe List'),
      ),
      
    );
  }
}
