import 'package:flutter/material.dart';

import 'stack.dart';
import 'percent.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Test';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
    //    body: const MyTestForm(),
    //    body: const StackScreen(),
        body: const PercentIndicator(),
      ),
    );
  }
}

class MyTestForm extends StatefulWidget {
  const MyTestForm({super.key});

  @override
  State<MyTestForm> createState() => _MyTestFormState();
}

class _MyTestFormState extends State<MyTestForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter some things';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Proccessing Data')));
              }
            },
            child: const Text('Submit'),
          ),
          )
        ],
      )
    );
  }
}