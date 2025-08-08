import 'package:flutter/material.dart';
import '../theme_inherited.dart';
import 'second_screen.dart';

class InheritedThemeHomePage extends StatelessWidget {
  const InheritedThemeHomePage({
    super.key,
    required this.toggleTheme,
  });
  final void Function() toggleTheme;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ThemeInheritedWidget.of(context)?.isDarkTheme ?? false;
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text('T H E M E  A P P'),
        actions: [
          IconButton(
            onPressed: toggleTheme,
            icon: Icon(
              isDarkTheme ? Icons.dark_mode : Icons.wb_sunny,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current theme: ${isDarkTheme ? 'Dark' : 'Light'}',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ),
                );
              },
              child: const Text(
                'Go to Next Screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
