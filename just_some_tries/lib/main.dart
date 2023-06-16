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
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
  const DetailScreen({super.key});

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