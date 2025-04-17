import 'package:flutter/material.dart';

class TodoTheme with ChangeNotifier {
  static ThemeData lightTodoTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: Colors.green,
    );
  }

  static ThemeData darkTodoTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.green,
    );
  }

  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleThemeSwitch() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
