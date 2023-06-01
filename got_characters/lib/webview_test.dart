import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';


class MyWebView extends StatelessWidget {
  final String url;

  const MyWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      
    );
  }
}
