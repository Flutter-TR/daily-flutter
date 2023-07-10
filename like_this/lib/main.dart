import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  IconData fabIcon = Icons.message;
  TabController? tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        setState(() {
          switch (tabController?.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2:
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whatsapp Test", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600)),
        actions: const <Widget>[
          Padding(padding: EdgeInsets.only(right: 20.0), child: Icon(Icons.search)),
          Padding(padding: EdgeInsets.only(right: 16.0), child: Icon(Icons.more_vert))
        ],
        backgroundColor: const Color.fromARGB(255, 7, 94, 84),
        bottom: const TabBar(tabs: [
          Tab(icon: Icon(Icons.camera_alt)),
          Tab(child: Text("CHATS"),),
          Tab(child: Text("STATUS",)),
          Tab(child: Text("CALLS",)),
        ], indicatorColor: Colors.white,
        //controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Icon(Icons.camera_alt),
          Text("Chat Screen"),
          Text("Status Screen"),
          Text("Call Screen"),
        ]
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {

      },
      backgroundColor: const Color.fromARGB(255, 37, 211, 102),
      child: Icon(fabIcon),
    ),
    );
  }
}