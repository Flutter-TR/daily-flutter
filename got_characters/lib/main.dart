

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:got_characters/screens/character_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';


void main() {
  setupWindow();
  runApp(MyApp());
}

const double windowWidth = 1200;
const double windowHeight = 800;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('JSON Sample');
    setWindowMinSize(const Size(windowWidth, windowHeight));
  }
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
      home: AllCharacters(),
      debugShowCheckedModeBanner: false,
    );
  }
}