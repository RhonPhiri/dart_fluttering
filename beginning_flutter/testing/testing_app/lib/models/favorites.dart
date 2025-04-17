import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  final List<int> _favoriteItems = [];

  List<int> get items => _favoriteItems;

  void addItem(int itemNumber) {
    _favoriteItems.add(itemNumber);
    notifyListeners();
  }

  void removeItem(int itemNumber) {
    _favoriteItems.remove(itemNumber);
    notifyListeners();
  }
}
