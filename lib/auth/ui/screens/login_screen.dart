// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
    
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Image.asset(
                'images/foodLogin.jpg',
                height: 170,
                ),
              SizedBox(height: 20,),
              // Title
              Text('Connexion',
              style: GoogleFonts.robotoCondensed(
                fontSize: 40, fontWeight: FontWeight.bold,
              ),
              ),
              
              // SubTitle
              Text('Welcome back! Nice to see you again :-)', 
              style: GoogleFonts.robotoCondensed(fontSize: 18),
              ),
              SizedBox(height: 50,),
              // Email Texrfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              // Passwordfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 35,),
              // Sing in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: Text('Sign in')),
                ),
              )
              // Text : sign up
          ],
          ),
        ),
      ),
    );
  } 
}
