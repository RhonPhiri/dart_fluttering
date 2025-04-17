import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterTheme with ChangeNotifier {
  bool _isLightMode = true;

  bool get isLightMode => _isLightMode;

  CounterTheme() {
    loadAppTheme();
  }

  Future<void> loadAppTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isLightMode = prefs.getBool('isLightMode') ?? true;
    notifyListeners();
  }

  Future<void> saveAppTheme() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLightMode', _isLightMode);
  }

  void changeTheme() {
    _isLightMode = !_isLightMode;
    saveAppTheme();
    notifyListeners();
  }
}
