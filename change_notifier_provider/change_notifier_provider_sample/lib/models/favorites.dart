import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  List<int> _items;

  set items(List<int> items) {
    _items = items;
    notifyListeners();
  }

  List<int> get items {
    return _items;
  }

  Favorites({List<int>? favorites}) : _items = favorites ?? [];

  addItem(int item) {
    _items.add(item);
    notifyListeners();
  }

  removeItem(int item) {
    _items.remove(item);
    notifyListeners();
  }

  @override
  String toString() {
    return 'Favorites Model with items$_items';
  }
}
