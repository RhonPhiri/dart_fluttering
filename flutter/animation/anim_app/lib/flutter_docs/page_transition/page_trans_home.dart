import 'package:flutter/material.dart';

class PageTransHomePage extends StatelessWidget {
  const PageTransHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text(
          'H O M E  P A G E',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: Text(
            'Go!',
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  //the pageroute builder is used to create a
  //custom transition between pages
  return PageRouteBuilder(
    //has 2 callbacks,
    //pagebuilder to create the page contents
    //and transitionsbuilder responsible for the transition
    pageBuilder: (context, animation, secondaryAnimation) =>
        PageTransDetailsPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //the animation object is Animation<double> with values 0-1
      //need to convert it to Animation<Offset> using tween
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      //to slow the animation down, create a curvetween and combine it
      //to the offset tween using .chain() method
      const curve = Curves.easeInOut;
      // final tween =
      //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      //since it's discouraged to call addlistener and setstate,
      //use widgets that extend animatedWidget, which listens to value change
      //of an animation object
      // final offsetAnimation = animation.drive(tween);
      //
      //OR
      //create an Curveanimation and call .animate method

      final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);
      final tween = Tween(begin: begin, end: end);
      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

class PageTransDetailsPage extends StatelessWidget {
  const PageTransDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('D E T A I L S  P A G E'),
      ),
    );
  }
}
