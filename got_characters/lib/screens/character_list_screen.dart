import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/character.dart';
import 'package:got_characters/screens/character_detail_screen.dart';

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
    setState(() {
      for(var i = 0; i < data.length; i++) {
        Character k = Character();
        k.id = data[i]['id'];
        k.fullName = data[i]['fullName'];
        k.img = data[i]['imageUrl'];

        characterArr.add(k);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getAllCharacters();
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
        itemCount:characterArr.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => Detail(id:characterArr[index].id)));
            },
            child: ListTile(
              title: Text(characterArr[index].fullName??"", style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 20.0),),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(characterArr[index].img??""),
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