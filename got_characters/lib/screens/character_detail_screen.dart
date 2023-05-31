import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:got_characters/models/character.dart';
import 'package:image_fade/image_fade.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final int id;

  const CharacterDetailsScreen({required this.id});

  @override
  _CharacterDetailsScreenState createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  Character? character;
  bool loadingx = false;

  @override
  void initState() {
    super.initState();
    fetchCharacterDetails();
  }

  Future<void> fetchCharacterDetails() async {
    //print(widget.id);
    final response = await http.get(Uri.parse('https://thronesapi.com/api/v2/characters/${widget.id}'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      //print(jsonData);
      setState(() {
        character = Character.fromJson(jsonData);
        loadingx = true;
      });
    } else {
      // Handle error
      print('Failed to fetch character details');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (character == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Character Details'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return  loadingx == false
        ? Scaffold(
            body: Center(
                child: SpinKitWave(
              color: Colors.white,
              size: 50.0,
            )),
          )
        : Scaffold(
        appBar: AppBar(
          title: const Text('Character Details'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                character?.fullName ?? 'full name null',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'Title: ${character?.title ?? 'title null'}',
              ),
            ),
            Center(
              child: Text(
                'Family: ${character?.family ?? 'family null'}',
              ),
            ),
            Center(
                  child: ImageFade(
                    image: NetworkImage(character?.img ?? 'image null'),
                    height: 200,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    fadeDuration: const Duration(seconds: 2),
                    fadeCurve: Curves.bounceInOut
                  )
                ),
          ],
        ),
      );
    }
  }
}
