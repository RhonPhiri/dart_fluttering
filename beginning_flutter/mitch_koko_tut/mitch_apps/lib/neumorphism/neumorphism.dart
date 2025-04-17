import 'package:flutter/material.dart';

class Neumorphism extends StatefulWidget {
  const Neumorphism({super.key});

  @override
  State<Neumorphism> createState() => _NeumorphismState();
}

class _NeumorphismState extends State<Neumorphism> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[850] : Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[850] : Colors.grey[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      color: isDarkMode ? Colors.grey.shade800 : Colors.white,
                      offset: Offset(-6, -6),
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: isDarkMode
                          ? Colors.grey.shade900
                          : Colors.grey.shade500,
                      offset: Offset(6, 6),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]),
              child: Icon(
                Icons.android,
                size: 60,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      foregroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        isDarkMode = false;
                      });
                    },
                    child: Text('Light'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        isDarkMode = true;
                      });
                    },
                    child: Text('Dark'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
