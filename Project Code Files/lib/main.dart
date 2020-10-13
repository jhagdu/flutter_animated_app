//Importing Required Modules
import 'package:AnimationApp/pages/firstpage.dart';
import 'package:AnimationApp/pages/home.dart';
import 'package:AnimationApp/pages/lights.dart';
import 'package:AnimationApp/pages/bars.dart';
import 'package:flutter/material.dart';

//Main Function
main() {
  runApp(AnimationApp());
}

//AnimationApp Class
class AnimationApp extends StatefulWidget {
  @override
  _AnimationAppState createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => FirstPage(),
        "/home": (context) => HomePage(),
        "/bars": (context) => Bars(),
        "/lights": (context) => Lights(),
      },
    );
  }
}
