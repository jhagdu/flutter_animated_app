//Importing Required Modules
import 'dart:math';

import 'package:AnimationApp/pages/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:animated_text/animated_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {
  var fpanimation;
  var animation;
  var clrs = [Colors.red, Colors.blue, Colors.green, Colors.deepOrange, Colors.purple, Colors.redAccent, Colors.greenAccent, Colors.grey, Colors.lightGreen, Colors.lightGreenAccent, Colors.lightBlueAccent, Colors.red];
  var clrsel = Random();

  @override
  void initState() {
    super.initState();
    fpanimation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = CurvedAnimation(parent: fpanimation, curve: Curves.bounceInOut)
    ..addListener(() {
      setState((){
      });
    });
    fpanimation.forward();
  }

  @override
  void dispose() {
    fpanimation.dispose();
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {

    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: clrs[clrsel.nextInt(7)]),
          ),
          child: Column(
            children: [
              Container(
                height: deviceHeight*0.5,
                width: deviceWidth,
                child: AnimatedText(
                  alignment: Alignment.center,
                  speed: Duration(milliseconds: 1000),
                  controller: AnimatedTextController.loop,
                  displayTime: Duration(milliseconds: 1000),
                  wordList: ['Animated','app','Developed By', 'Aman', 'Jhagrolia','📱📱📱'],
                  textStyle: TextStyle(
                    color: clrs[clrsel.nextInt(11)],
                    fontSize: 50,
                    fontWeight: FontWeight.w700
                  ),
                  onAnimate: (index) {
                    fpanimation.forward(from: 0.2);
                  },
                ),
              ),

              Container(
                height: deviceHeight*0.4,
                width: deviceWidth,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withBlue(100),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: clrs[clrsel.nextInt(11)], width: 2)
                      ),
                      width: 15*animation.value+180,
                      height: 15*animation.value+60,
                      child: Center(
                        child: ColorizeAnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          text: ["For Home", "Click Me"],
                          textStyle: TextStyle(
                              fontSize: 35.0, 
                              fontFamily: "Horizon",
                              fontWeight: FontWeight.w900,
                          ),
                          colors: [
                            Colors.purple,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ],
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
