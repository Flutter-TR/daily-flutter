// @dart=2.9
import 'package:got_characters/screens/character_list_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game of Thrones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF67e6dc),
        secondaryHeaderColor: const Color(0xFF222f3e),
        //backgroundColor: Color(0xFFfc5c65),
      ),
      home: const AllCharacters(),
    );
  }
}