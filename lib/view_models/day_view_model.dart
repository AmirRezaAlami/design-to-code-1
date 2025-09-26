import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:task_management_app_ui/view_models/month_view_model.dart';

class DayViewmodel extends ChangeNotifier {
  int _selectedDayIndex = -1;
  MonthViewmodel? _monthVM;

  final List<String> _daysOfWeek = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];
  int get selectedDayIndex => _selectedDayIndex;
  List<String> get daysOfWeek => _daysOfWeek;

  void selectDayContainer(int index) {
    if (_selectedDayIndex == index) {
      _selectedDayIndex = -1;
    } else {
      _selectedDayIndex = index;
    }
    notifyListeners();
  }

  void injectMonth(MonthViewmodel monthVM) {
    _monthVM ??= monthVM;
  }

  void resetToggle() {
    if (_monthVM?.isMonthChanged == true) {
      _selectedDayIndex = -1;
      _monthVM!.isMonthChanged = false;
      notifyListeners();
    }
  }
}
