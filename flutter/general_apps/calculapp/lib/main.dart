import 'package:calculapp/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;
  void changeTheme(bool isBright) {
    setState(() {
      themeMode = isBright ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: _darkColorScheme,
      ),
      home: HomePage(
        changeTheme: (p0) => changeTheme(p0),
      ),
    );
  }
}

ColorScheme _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Colors.grey.shade100,
  onPrimary: Colors.black,
  secondary: Colors.grey.shade200,
  onSecondary: Colors.black,
  tertiary: Colors.grey.shade300,
  onTertiary: Colors.black,
  error: Colors.red,
  onError: Colors.white,
  surface: Colors.white,
  onSurface: Colors.black,
);
ColorScheme _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Colors.grey.shade900,
  onPrimary: Colors.white,
  secondary: Colors.grey.shade800,
  onSecondary: Colors.white,
  tertiary: Colors.grey.shade700,
  onTertiary: Colors.white,
  error: Colors.red,
  onError: Colors.white,
  surface: Colors.black,
  onSurface: Colors.white,
);
