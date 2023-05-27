import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/character.dart';

class AllCharacters extends StatefulWidget {
  const AllCharacters({super.key});

  @override
  State<AllCharacters> createState() => _AllCharactersState();
  //_AllCharactersState createState() => _AllCharactersState();
}

class _AllCharactersState extends State<AllCharacters> {

  final String charsURL = "https://thronesapi.com/api/v2/characters";

  List<Character> characterArr = <Character>[];
  void getAllCharacters() async {
    Response res = await get(charsURL);

    //print(res.body);

    var data = await jsonDecode(res.body);
    //print(data[0]);
    for(var i = 0; i < data.length; i++) {
      Character k = Character();
      k.id = data[i]['id'];
      k.fullName = data[i]['fullName'];
      k.img = data[i]['imageUrl'];

      characterArr.add(k);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of Thrones'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
              getAllCharacters();
          }, child: const Text('All Characters'),
        ),
      ),
    );
  }
}