import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);
  
  @override
  State<NewHome> createState() => _NewHomeState();
}
  
class _NewHomeState extends State<NewHome> {
  var jsonList;
  @override
  void initState() {
    //super.initState();
    getData();
  }
  
  void getData() async {
    try {
      var response = await Dio()
          .get('https://thronesapi.com/api/v2/characters');
      //print(response);
      if(response.statusCode == 200) {
        setState(() {
          jsonList = response.data as List;
          //print(jsonList);
        });
      } else {
        print(response.statusCode);
      }
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
          //itemCount: 10,
          itemCount: jsonList == null ? 0 : jsonList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  jsonList[index]['imageUrl'],
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(jsonList[index]['fullName']),
              subtitle: Text(jsonList[index]['family']),
            ));
          }),
    );
  }
}