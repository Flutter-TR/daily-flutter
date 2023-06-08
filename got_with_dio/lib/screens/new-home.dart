import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);
  
  @override
  State<NewHome> createState() => _NewHomeState();
}
  
class _NewHomeState extends State<NewHome> {
  @override
  void initState() {
    //super.initState();
    getData();
  }
  
  void getData() async {
    try {
      var response = await Dio()
          .get('https://thronesapi.com/api/v2/characters');
      print(response);
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GoT Characters',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const Card(
                child: ListTile(
              title: Text('name'),
              subtitle: Text('family'),
            ));
          }),
    );
  }
}