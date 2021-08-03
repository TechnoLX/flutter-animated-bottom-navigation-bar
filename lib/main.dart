import 'package:flutter/material.dart';

import 'animatedBottomNavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animated Bottom Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Animated BottomNavBar'),
    );
  }
}

//Today Topic: Animated Bottom Navigation Bar
//As i discussed about Bottom Navigation Bar in the video which uploaded earlier
//and i would like to discuss more about animated bottom navigation bar as well
//in this video, i will demo a simple animated bar using AnimatedContainer widget

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //let's create another class for body
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        title: Text(widget.title),
      ),
      body: AnimatedBottomNavBar(),
    );
  }
}

//Thank for watching
//If you like this video, please do like, subscribe, share and comment to my channel!
//see you in the next video! Stay Tuned!
