
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  int selectedIndex = 1;
  getIndexTab(index) {
    selectedIndex = index;
    notifyListeners();
  }
}