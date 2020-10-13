//Importing Required Modules
import 'dart:math';

import 'package:flutter/material.dart';

class Lights extends StatefulWidget {
  @override
  _LightsState createState() => _LightsState();
}

class _LightsState extends State<Lights> with SingleTickerProviderStateMixin{
  var colrs = Random();
  var lghtanim;
  var animation;

  @override
  void initState() {
    super.initState();
    lghtanim = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
      reverseDuration: Duration(seconds: 40)
    );

    animation = Tween<double>(begin: 0, end: 1)
      .chain(CurveTween(curve: Curves.elasticOut))
      .animate(lghtanim)
    ..addListener(() {
      setState(() {
      });
    });

    lghtanim.forward();
    lghtanim.repeat(reverse: true);
  }

  @override
  void dispose() {
    lghtanim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext concolrs) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            for ( var i in  [[10,10],[70,50],[120,100],[150,150],[180,210],[180,250],[160,300],
                  [100,290],[80,250],[100,190],[190,110],[230,80],[270,70],[300,100],
                  [340,140],[370,170],[390,210],[410,260],[460,280],[500,270],[540,250],
                  [570,200],[570,160],[570,110],[550,60],[550,60],[500,40]]) Positioned(
              top: i[0] + 0.1,
              left: i[1] + 0.1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  color: Color.fromARGB((i[0]*100*animation.value).round(), (i[0]*100*animation.value).round(), (i[0]*animation.value).round(), 1),  
                ),
                height: 15*(animation.value*animation.value)+30, 
                width: 15*(animation.value*animation.value)+30,
              )
            ),
          ],
        ), 
      ),
    );
  }
}
