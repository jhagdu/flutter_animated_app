//Importing Required Modules
import 'package:AnimationApp/pages/globalvariables.dart';
import 'package:AnimationApp/pages/polygon.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:dough/dough.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  AnimationController homeAnim;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    homeAnim = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
      reverseDuration: Duration(seconds: 10)
    );

    animation = CurvedAnimation(parent: homeAnim, curve: Curves.bounceInOut)
    ..addListener(() {
      setState(() {});
    });
    homeAnim.forward();
    homeAnim.repeat();
  }

  @override
  void dispose() {
    homeAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: clrlist[lngt.round() - 3],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                border: Border.all(color: clrlist[lngt.round() - 3], width: 2),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: clrlist[lngt.round() - 3], width: 2),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                color: Colors.black,
              ),
              height: (deviceHeight*0.6*(lngt/10)) + deviceHeight*0.4,
            ),

            Positioned(
              bottom: deviceHeight*0.40,
              child: Container(
                margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                height: deviceHeight*0.6,
                width: deviceWidth,
                child: Center(child: PolyAnimation())
              )
            ),

            Positioned(
              top: deviceHeight*0.60,
              child: Container(
                height: deviceHeight*0.45,
                margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/lights");
                      },
                      child: PressableDough(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: clrlist[(lngt % 2).round()],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: clrlist[(lngt % 3).truncate()], width: 2)
                          ),
                          width: 180,
                          height: 60,
                          child: Center(
                            child: ColorizeAnimatedTextKit(
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              text: ["Light Balls"],
                              textStyle: TextStyle(
                                fontSize: 30.0, 
                                fontFamily: "Horizon",
                                fontWeight: FontWeight.w900,
                              ),
                              colors: [
                                Colors.purple,
                                Colors.blue,
                                Colors.yellow,
                                Colors.red,
                              ],
                              alignment: AlignmentDirectional.topStart
                            ),
                          ),
                        ),
                      ),
                    ),

                    GyroDough(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/bars");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: clrlist[(lngt % 2).round()],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: clrlist[(lngt % 3).truncate()], width: 2)
                          ),
                          width: 210,
                          height: 50,
                          child: Center(
                            child: ColorizeAnimatedTextKit(
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              text: ["Disco Bars"],
                              textStyle: TextStyle(
                                fontSize: 30.0, 
                                fontFamily: "Horizon",
                                fontWeight: FontWeight.w900,
                              ),
                              colors: [
                                Colors.purple,
                                Colors.blue,
                                Colors.yellow,
                                Colors.red,
                              ],
                              alignment: AlignmentDirectional.topStart
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}