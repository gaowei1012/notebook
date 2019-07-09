import 'package:flutter/foundation.dart';

class CountInfo with ChangeNotifier {
  int _count = 0;
  int get count => _count++;

  void increment() {
    _count++;
    notifyListeners();
  }

}