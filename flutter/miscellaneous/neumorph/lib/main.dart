import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.light(), home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("N E U M O R P H"),
        backgroundColor: Colors.grey.shade400,
      ),
      body: Center(child: NeumorphButton(child: Icon(Icons.apple, size: 64))),
    );
  }
}

class NeumorphButton extends StatefulWidget {
  final Widget child;
  const NeumorphButton({super.key, required this.child});

  @override
  State<NeumorphButton> createState() => _NeumorphButtonState();
}

class _NeumorphButtonState extends State<NeumorphButton> {
  ///Variable holding the pressed state of the button
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    ///Variable holding the blurRadius of the containers
    final double blurRadius = _isPressed ? 2 : 10;

    ///Variable holding the spreadRadius
    final double spreadRadius = _isPressed ? 0 : 1;

    ///Variable holding the blur style
    final BlurStyle blurStyle = _isPressed ? BlurStyle.solid : BlurStyle.normal;

    ///Variable holding the light-topLeft Shadow color
    final Color lightTop = _isPressed ? Colors.grey.shade600 : Colors.white;

    ///Variable holding the light bottom-right shadow Color
    final Color lightBottom = _isPressed
        ? Colors.grey.shade200
        : Colors.grey.shade600;

    return Listener(
      onPointerDown: (event) => setState(() {
        _isPressed = true;
      }),
      onPointerUp: (event) => setState(() {
        _isPressed = false;
      }),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(16)),

          boxShadow: [
            BoxShadow(
              color: lightTop,
              offset: Offset(-5, -5),
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              blurStyle: blurStyle,
            ),
            BoxShadow(
              color: lightBottom,
              offset: Offset(5, 5),
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              blurStyle: blurStyle,
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
