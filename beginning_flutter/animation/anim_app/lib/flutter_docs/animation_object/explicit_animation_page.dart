//Explicit animations
//so called because they have an ANIMATIONCONTROLLER that allows the
//animtaion to start when explicitly asked to
//built in explicit animations e.g RotationTransition(), extend an animatedWidget
//some however have the turns property requiring the animation object

//ANIMATION OBJECT
//It interpolates the values used to guide the animation
//Knows the current state of the animation (stopped, revered, etc.)
//generates interpolated numbers between [2 values over a certain duration (provided by Animation Controller)]
//The output of an animation can be linear, a curve, a step function or any other mapping
//depending on how the animation is controlled, it could run in reverse/ switch directions
//The animation object has state, its current value can be accessed by the .value method
//The animation object doesn't render/ build

//CURVEDANIMATION
//defines the progress/ interpolation of the animation as non-linear

//ANIMATION CONTROLLER
//Manages the animation
//generates a new value from 0.0-0.1 whenever the machine is ready to generate a new frame
//in a given duration
//Can be used wherever an animation object is needed but has additional methods to manage the animation
//vsync is important as it prevents offscreen animations from using unnecessary resources

//TWEEN
//AnimationsController ranges 0.0-0.1 by default
//tween is used to configure an animation to interpolate to a different range or data type
//use the .animate method to use the tween and pass in the controller

//ANIMATION NOTIFICATION
//A listener is called whenever the value of animation changes
//the most common use of the listener is to setstate causing a rebuild
//statuslistener is used to listen to the status of the animation changes

//both animationController & curvedAnimation are of type animation<double> hence can be passed
//interchangeably

//ANIMATED WIDGET
//Is used to create a widget that performs a reusable animation.
//If the transition is to be seprated from the widget then use animationbuilder
//Built-in animatedwidgets include the FooTransitions
//prevents the usage of addlistener and setstate as it calls setstate in the background
//The class extends an animatedWidget that requires a listenable which is the property you want to
//listen to

//ANIMATED BUILDER
//Whilst animatedwidget knows how to render the widget, the bulder doesn't, it only renders the
//transition
//Used to describe the animation as part of the build method for another widget
//examples of built-in animatedBuilder include scaffold, popupmenu, progressindicator, etc.
//also listens to notifications from animation object hence no need to call addlistener
//AnimatedBuilder is retained from a stl widget. Takes in an anounymous build method and the widget
//to be randered as parameters
//Used to seperate the transition rendering logic from the widget rendering logic

import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({super.key});

  @override
  State<ExplicitAnimationPage> createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    _rotateAnimation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
        reverseCurve: Curves.easeIn,
      ),
    )..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            _controller.reverse();

          case AnimationStatus.dismissed:
            _controller.forward();

          default:
        }
      });
    _sizeAnimation = Tween<double>(
      begin: 100,
      end: 200,
    ).animate(
      _controller,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MySizeTransition(
              animation: _sizeAnimation,
              child: ContainerCanvas(),
            ),
            SizedBox(height: 100),
            AnimWidgetRotateCircle(
              animation: _rotateAnimation,
            ),
          ],
        ),
      ),
    );
  }
}

//EXAMPLE of animated widget
class AnimWidgetRotateCircle extends AnimatedWidget {
  const AnimWidgetRotateCircle({
    super.key,
    required Animation<double> animation,
  }) : super(
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateZ(animation.value),
      child: ClipOval(
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 200,
          color: Colors.green,
          child: Text(
            'R;',
            style: TextStyle(
              color: Colors.white,
              fontSize: 100,
            ),
          ),
        ),
      ),
    );
  }
}

//Example of AnimatedBuilder
class ContainerCanvas extends StatelessWidget {
  const ContainerCanvas({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF)),
    );
  }
}

//The transitioning widget
class MySizeTransition extends StatelessWidget {
  const MySizeTransition({
    super.key,
    required this.animation,
    required this.child,
  });
  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          width: animation.value,
          height: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}
