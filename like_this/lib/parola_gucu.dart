import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'password test',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _password;
  double _strength = 0;

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  String _displayText = 'Parolanızı girin';

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
        _displayText = 'Parolanızı girin';
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = 'Parolanız çok kısa';
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        _displayText = 'Parolanız kabul edilebilir seviyede fakat güçlü değil';
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          _strength = 3 / 4;
          _displayText = 'Parolan Güçlü';
        });
      } else {
        
        setState(() {
          _strength = 1;
          _displayText = 'Parolan Harika';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Parola Gücü Gösterimi"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => _checkPassword(value),
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Parola'),
              ),
              const SizedBox(
                height: 25,
              ),

              LinearProgressIndicator(
                value: _strength,
                backgroundColor: Colors.grey[300],
                color: _strength <= 1 / 4
                    ? Colors.red
                    : _strength == 2 / 4
                        ? Colors.yellow
                        : _strength == 3 / 4
                            ? Colors.blue
                            : Colors.green,
                minHeight: 15,
              ),
              const SizedBox(
                height: 20,
              ),


              Text(
                _displayText,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 50,
              ),

              ElevatedButton(
                  onPressed: _strength < 1 / 2 ? null : () {},
                  child: const Text('Devam'))
            ],
          ),
        ));
  }
}