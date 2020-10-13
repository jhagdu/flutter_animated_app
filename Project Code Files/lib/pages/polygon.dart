//Importing Required Modules
import 'package:flutter/material.dart';
import 'dart:math' as math;

var lngt = 3.0;
var clrlist = [Colors.deepOrange, Colors.tealAccent, Colors.green, Colors.red, Colors.indigo, Colors.greenAccent, Colors.lime, Colors.deepPurpleAccent];
var brdrwdt = 10.0;

class PolyAnimation extends StatefulWidget {
  @override
  _PolyAnimationState createState() => _PolyAnimationState();
}

class _PolyAnimationState extends State<PolyAnimation> with TickerProviderStateMixin {
  var _sides = lngt;
  
  Animation<double> sizeAnimation;
  AnimationController sizeController;

  Animation<double> angularAnimation;
  AnimationController angleController;

  @override
  void initState() {
    super.initState();

    sizeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    angleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    Tween<double> _radiusTween = Tween(begin: 20.0, end: 100);
    Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

    sizeAnimation = _rotationTween.animate(sizeController)
      ..addListener(() {
        setState(() {
          brdrwdt = sizeAnimation.value*sizeAnimation.value * 10 + 10;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          sizeController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          sizeController.forward();
        }
      });

    angularAnimation = _radiusTween.animate(angleController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          angleController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          angleController.forward();
        }
      });

    sizeController.forward();
    angleController.forward();
  }

  @override
  void dispose() {
    angleController.dispose();
    sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: AnimatedBuilder(
                animation: sizeAnimation,
                builder: (context, snapshot) {
                  return CustomPaint(
                    painter: ShapePainter(_sides, angularAnimation.value, sizeAnimation.value),
                    child: Container(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
            ),
            Slider(
              activeColor: clrlist[(_sides-3).round()],
              value: _sides,
              min: 3.0,
              max: 10.0,
              label: _sides.toInt().toString(),
              divisions: 7,
              onChanged: (value) {
                setState(() {
                  _sides = value;
                  lngt = value;
                });
              },
            ),
          ],
        ),
      );
  }
}

//Drawing Polygon
class ShapePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;
  ShapePainter(this.sides, this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = clrlist[lngt.round() - 3]
      ..strokeWidth = brdrwdt
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}