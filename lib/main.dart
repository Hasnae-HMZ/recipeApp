// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:recipes/auth/ui/screens/login_screen.dart';
// import 'package:recipes/recipe/ui/screens/home_recipes.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();  // Assurez-vous que les liaisons Flutter sont initialisées
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LoginScreen()
      // RecipeListScreen() ,
    );
    
  }
}

