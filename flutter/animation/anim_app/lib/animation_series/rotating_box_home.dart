import 'dart:math';

import 'package:flutter/material.dart';

class RotatingBoxHomePage extends StatefulWidget {
  const RotatingBoxHomePage({super.key});

  @override
  State<RotatingBoxHomePage> createState() => _RotatingBoxHomePageState();
}

class _RotatingBoxHomePageState extends State<RotatingBoxHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: (2 * pi),
    ).animate(_animationController);

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(_animation.value),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 3),
                        blurRadius: 7,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
