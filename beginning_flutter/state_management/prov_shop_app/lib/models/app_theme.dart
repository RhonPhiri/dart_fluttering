import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme extends ChangeNotifier {
  bool _isBright = false;

  bool get isBright => _isBright;

  void changeTHeme() {
    _isBright = !_isBright;
    notifyListeners();
  }

//
//
//
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.grey.shade100,
      onPrimary: Colors.black,
      secondary: Colors.grey.shade200,
      onSecondary: Colors.black,
      tertiary: Colors.grey.shade300,
      onTertiary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.grey.shade50,
      onSurface: Colors.black,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.playfairDisplay(
        fontSize: 16,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.grey.shade800,
      onPrimary: Colors.white,
      secondary: Colors.grey.shade700,
      onSecondary: Colors.white,
      tertiary: Colors.grey.shade600,
      onTertiary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.grey.shade900,
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.playfairDisplay(
        fontSize: 16,
      ),
    ),
  );
}
