//Consists of overlapping animations
//when making staggered animations, you provide the timelive, the interval
//with which the animation will run
//The interval should be between 0.0 and 1.0 which represents the values of
//the animationController

import 'package:flutter/material.dart';

class StaggerHomePage extends StatefulWidget {
  const StaggerHomePage({super.key});

  @override
  State<StaggerHomePage> createState() => _StaggerHomePageState();
}

class _StaggerHomePageState extends State<StaggerHomePage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Container(
          child: StaggerAnimation(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({
    super.key,
    required this.controller,
  })  : opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.1),
          ),
        ),
        alignment =
            Tween<Alignment>(begin: Alignment.topCenter, end: Alignment.center)
                .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.1, 0.25),
          ),
        ),
        borderRadius = Tween<BorderRadius>(
                begin: BorderRadius.circular(150),
                end: BorderRadius.circular(0))
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.25),
          ),
        ),
        width = Tween<double>(begin: 50, end: 300).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.25, 0.375),
          ),
        ),
        height = Tween<double>(begin: 50, end: 300).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.375, 0.5),
          ),
        ),
        innerOPacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0),
          ),
        );

  final AnimationController controller;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<double> opacity;
  final Animation<Alignment> alignment;
  final Animation<BorderRadius> borderRadius;
  final Animation<double> innerOPacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          alignment: alignment.value,
          child: Opacity(
            opacity: opacity.value,
            child: Container(
              height: height.value,
              width: width.value,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: borderRadius.value,
              ),
              child: Opacity(
                  opacity: innerOPacity.value,
                  child: Image.asset('assets/dash_profile.png')),
            ),
          ),
        );
      },
    );
  }
}
