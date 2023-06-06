import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text(
              'Anasayfa',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 1,
                  child: Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pushNamed(context, 'a');
                  },
                ),
                SizedBox(
                  width: 25.0,
                ),
                FloatingActionButton(
                  heroTag: 2,
                  child: Icon(Icons.navigate_next),
                  onPressed: () {
                    Navigator.pushNamed(context, '/secondRoute');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}