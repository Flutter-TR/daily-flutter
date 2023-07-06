import 'package:flutter/material.dart';
import 'package:like_this/widget_test.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
   // final wordPair = WordPair.random();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Random English Words",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const RandomWords(),
    );
  }
}
