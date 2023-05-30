import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:got_characters/functions/card.dart';
import 'package:got_characters/models/character.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:image_fade/image_fade.dart';

class Detail extends StatefulWidget {
  //const Detail({super.key});
  final int? id;
  Detail({this.id});
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Character k = Character();
  bool loadingx = false;

  void getCharacter() async {
    // print(widget.id);
    Response res =
        await get('https://thronesapi.com/api/v2/characters/${widget.id}');
    var data = await jsonDecode(res.body);
    //print(data);
    setState(() {
      k.fullName = data[0]['fullName'] ?? 'Unknown';
      k.img = data[0]['imgUrl'] ?? 'Unknown';
      k.title = data[0]['title'] ?? 'Unknown';
      k.family = data[0]['family'] ?? 'Unknown';
      loadingx = true;
    });
  }

  @override
  void initState() {
    getCharacter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loadingx == false
        ? Scaffold(
            body: Center(
                child: SpinKitWave(
              color: Colors.white,
              size: 50.0,
            )),
          )
        : Scaffold(
            appBar: AppBar(
              title: TypewriterAnimatedTextKit(
                text: [k.fullName.toString()],
                repeatForever: false,
                textStyle: const TextStyle(
                  fontSize: 22.0, fontStyle: FontStyle.italic
                ),
                speed: const Duration(milliseconds: 30),
              ),
            ),

            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: ImageFade(
                    image: NetworkImage('${k.img}'),
                    height: 200,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    fadeDuration: const Duration(seconds: 2),
                    fadeCurve: Curves.bounceInOut
                  )
                ),
                const SizedBox(
                  height: 10.0,
                  width: 250.0,
                  child: Divider(
                    color: Colors.black,
                  )
                ),
                createCard('Name:', k.fullName.toString(), context) ,
                createCard('Title:', k.title.toString(), context) ,
                createCard('Family:', k.family.toString(), context) ,
              ],
            )
          );
  }
}
