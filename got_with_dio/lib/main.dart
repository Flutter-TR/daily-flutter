import 'package:flutter/material.dart';

import 'package:got_with_dio/router.dart';
import 'package:got_with_dio/screens/new-home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Routering.generateRoute,
      initialRoute: homeRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewHome(),
    );
  }
}
