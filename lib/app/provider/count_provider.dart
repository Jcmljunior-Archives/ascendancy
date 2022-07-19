import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int count = 0;

  void increment() {
    count >= 0 ? count++ : count;
    notifyListeners();
  }

  void decrement() {
    count >= 1 ? count-- : count;
    notifyListeners();
  }
}
