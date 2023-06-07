import 'package:flutter/material.dart';
import 'package:got_with_dio/screens/home.dart';
import 'package:got_with_dio/screens/second_screen.dart';

class Routering {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const Home());
      case secondScreenRoute:
        return MaterialPageRoute(builder: (_) => const SecondScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: Text('Ters giden birşeyler oldu'),
                ),
              ),
        );
    }
  }
}

const String homeRoute = '/';
const String secondScreenRoute = '/secondScreen';