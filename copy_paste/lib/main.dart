import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Copy Paste Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copy Paste Example!'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: message,
                  decoration: const InputDecoration(hintText: 'Write Something'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          if (message.text.trim() == "") {
                              
                            // do nothing
                          } else {
                            FlutterClipboard.copy(message.text)
                                .then((value) => print('copied text'));
                          }
                        },
                        child: const Text(
                          'COPY',
                          style: TextStyle(color: Colors.white),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        FlutterClipboard.paste().then((value) {
                          setState(() {
                            message.text = value;
                          });
                        });
                      },
                      child: const Text(
                        'PASTE',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}