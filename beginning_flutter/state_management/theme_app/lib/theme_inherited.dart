import 'package:flutter/material.dart';

class ThemeInheritedWidget extends InheritedWidget {
  final bool isDarkTheme;

  const ThemeInheritedWidget({
    super.key,
    required super.child,
    required this.isDarkTheme,
  });

  static ThemeInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
  }

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    return oldWidget.isDarkTheme != isDarkTheme;
  }
}
