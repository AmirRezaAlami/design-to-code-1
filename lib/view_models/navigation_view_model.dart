import 'package:flutter/material.dart';

import '../others/constants/colors.dart';

class NavigationViewmodel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  Color getIconColor(int index) {
    return _selectedIndex == index ? Palette.navColor : Colors.white;
  }

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
