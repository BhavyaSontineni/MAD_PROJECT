import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'favorite_provider.dart';
 import 'package:provider/provider.dart';

void main() {
  runApp(
     ChangeNotifierProvider(
       create: (context) => FavoriteProvider(),
       child: MyApp(),
     ),
   );
 }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe and Meal Planning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Defines the starting screen
      routes: {
        '/': (context) => LoginPage(), // Home screen
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(userId: 'testUser',),
        '/profile': (context) => ProfilePage(userId: 'testUser',),
      },
    );
  }
}