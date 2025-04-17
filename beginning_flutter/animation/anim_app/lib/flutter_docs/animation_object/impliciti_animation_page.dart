//Flutter provides animated versions of the common widgets e.g container,
//opacity etc.
//One can control their duration and the way they interpolate
//to a new value using the curve
//
//Example
//Animating the flutter LOGO
import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({super.key});

  @override
  State<ImplicitAnimationPage> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  double size = 10;

  void initialize() {
    setState(() {
      size = Random().nextDouble() * 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I M P L I C I T  A N I M'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: size,
              height: size,
              color: Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF)),
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: initialize,
              child: Text('Change'),
            ),
          ],
        ),
      ),
    );
  }
}
