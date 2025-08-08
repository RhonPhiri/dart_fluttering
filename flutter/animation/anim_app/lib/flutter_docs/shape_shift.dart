//performing an implicit animation using animated container
import 'dart:math';
import 'package:flutter/material.dart';

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class ShapeShift extends StatefulWidget {
  const ShapeShift({super.key});

  @override
  State<ShapeShift> createState() => _ShapeShiftState();
}

class _ShapeShiftState extends State<ShapeShift> {
  late Color color;
  late double margin;
  late double borderRadius;

  @override
  void initState() {
    super.initState();
    color = randomColor();
    margin = randomMargin();
    borderRadius = randomBorderRadius();
  }

  void shiftShape() {
    setState(() {
      color = randomColor();
      margin = randomMargin();
      borderRadius = randomBorderRadius();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shape-Shifting Effect'),
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            ElevatedButton(onPressed: () => shiftShape(), child: Text('Change'))
          ],
        ),
      ),
    );
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return sin(t * pi * 2);
  }
}
