import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({super.key});

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Stack Screen Test"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        color: Colors.red,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget> [
            Positioned(
              bottom: -38,
              left: 25,
              child: GestureDetector(
                onTap: () {
                  debugPrint("Clicked Button");
                },
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    )
                  ),
                  child: const Icon(Icons.person, color: Colors.white, size: 40,),
                )
              )
            ),

            const Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                "Username: Demo",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ],
          
        )
      ),
    );
  }
}