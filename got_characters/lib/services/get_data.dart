import 'dart:convert';
import 'package:http/http.dart';
import 'package:got_characters/models/character.dart';

class HttpService {
  final String charactersURL = "https://thronesapi.com/api/v2/characters";

  Future<List<Character>> getPosts() async {
    Response res = await get(charactersURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Character> characters = body
        .map(
          (dynamic item) => Character.fromJson(item),
        )
        .toList();

      return characters;
    } else {
      throw "Unable to retrieve characters.";
    }
  }
}