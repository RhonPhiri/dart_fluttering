import 'package:flutter/material.dart';
import '../theme_inherited.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ThemeInheritedWidget.of(context)?.isDarkTheme ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('S e c o n d  s c r e e n'),
      ),
      body: Center(
        child: Text(
          'Current theme: ${isDarkTheme ? 'Dark' : 'Light'}',
        ),
      ),
    );
  }
}
