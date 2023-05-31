import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:got_characters/models/character.dart';
import 'package:got_characters/screens/character_detail_screen.dart';

class AllCharacters extends StatefulWidget {
  //const AllCharacters({super.key});

  @override
  //State<AllCharacters> createState() => _AllCharactersState();
  _AllCharactersState createState() => _AllCharactersState();
}

class _AllCharactersState extends State<AllCharacters> {

  final String charsURL = "https://thronesapi.com/api/v2/characters";

  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    final response =
        await http.get(Uri.parse(charsURL));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        characters = List<Character>.from(jsonData.map((x) => Character.fromJson(x)));
      });
    } else {
      // Handle error
      print('Failed to fetch characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of Thrones'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.yellow, Colors.red],
            tileMode: TileMode.mirror
          ) 
        ),
        child: ListView.builder(
        itemCount:characters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterDetailsScreen(id: characters[index].id!)));
            },
            child: ListTile(
              title: Text(characters[index].fullName??"", style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 20.0),),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(characters[index].img??""),
              ),
            ),
          );
        },
      )
      ),
      
      /*body: Center(
        child: ElevatedButton(
          onPressed: () {
              //getAllCharacters();
          }, child: const Text('All Characters'),
        ),
      ),*/
    );
  }
}