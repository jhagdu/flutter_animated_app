//Importing Required Modules
import 'dart:math';

import 'package:AnimationApp/pages/globalvariables.dart';
import 'package:flutter/material.dart';

class Bars extends StatefulWidget {
  @override
  _BarsState createState() => _BarsState();
}

class _BarsState extends State<Bars>  with SingleTickerProviderStateMixin {

  var cnt = Random();
  var rndm = [100, 200];
  var barsanim;
  var animation;

  @override
  void initState() {
    super.initState();
    barsanim = AnimationController(
      vsync: this,
      duration: Duration(seconds: 100),
      reverseDuration: Duration(seconds: 1)
    );

    animation = CurvedAnimation(parent: barsanim, curve: Curves.bounceInOut)
      ..addListener(() {
        setState(() {
          // ignore: unused_local_variable
          rndm = [for (var j in List<int>.generate((deviceHeight/15).round(), (j) => j + 1)) cnt.nextInt(255)];
        });
      });

    barsanim.forward(from: 0.5);
    barsanim.repeat(reverse: true);
  }

  @override
  void dispose() {
    barsanim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color:  Color.fromRGBO((10*animation.value).round(), (250*animation.value).round(), (animation.value).round(), 1),
                  width: 5,
                ),
                right: BorderSide(
                  color:  Color.fromRGBO((10*animation.value).round(), (250*animation.value).round(), (animation.value).round(), 1),
                  width: 5,
                ),
              ),
            ),
            child: Column(
              children: [
                for ( var i in rndm) Center(child: Text("=" * ((deviceWidth/10).round()), 
                style: TextStyle(color: Color.fromRGBO((i*animation.value).round(), (i*100*animation.value).round(), (i*animation.value).round(), 1)),
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}