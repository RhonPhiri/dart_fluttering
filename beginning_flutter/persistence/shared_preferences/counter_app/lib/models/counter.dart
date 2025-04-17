import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  Counter() {
    loadCounter();
  }

  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    _count = prefs.getInt('count') ?? 0;
    notifyListeners();
  }

  void incrementCount() {
    _count++;
    saveCountValue();
    notifyListeners();
  }

  Future<void> saveCountValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('count', _count);
  }

  Future<void> clearCountValue() async {
    _count = 0;
    notifyListeners();
  }
}
