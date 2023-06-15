import 'dart:html';

import 'package:flutter/material.dart';

//import 'app.dart';

void main() {
  runApp(
    const NavTest(),
  );
}
class NavTest extends StatelessWidget {
  const NavTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/details');
          },
          child: const Text(
            "Test",
            style: TextStyle(color: Colors.white),
          ),
        )
      )
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Pop Test",
            style: TextStyle(color: Colors.white),
          ),
        )
      ),
    );
  }
}