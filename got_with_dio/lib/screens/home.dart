import 'package:flutter/material.dart';

import '../router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                  child: const Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pushNamed(context, 'a');
                  },
                ),
                const SizedBox(
                  width: 25.0,
                ),
                FloatingActionButton(
                  heroTag: 2,
                  child: const Icon(Icons.navigate_next),
                  onPressed: () {
                    Navigator.pushNamed(context, secondScreenRoute);
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