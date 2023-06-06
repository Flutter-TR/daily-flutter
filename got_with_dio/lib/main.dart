import 'package:flutter/material.dart';

//import 'package:dio/dio.dart';

import 'package:got_with_dio/router.dart';
import 'package:got_with_dio/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Routering.generateRoute,
      initialRoute: homeRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
