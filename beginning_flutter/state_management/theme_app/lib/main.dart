import 'package:flutter/material.dart';
import 'screens/inherited_theme_home_page.dart';
import 'theme_inherited.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //initialise the current theme
  bool _isDarkTheme = false;
  //method to toggle the _isDarkTheme to opposite
  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      isDarkTheme: _isDarkTheme,
      child: MaterialApp(
        theme: _isDarkTheme
            ? ThemeData.dark(useMaterial3: true)
            : ThemeData.light(),
        home: InheritedThemeHomePage(
          toggleTheme: _toggleTheme,
        ),
      ),
    );
  }
}
