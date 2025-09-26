import 'package:flutter/material.dart';

class MonthViewmodel extends ChangeNotifier {
  int _currentMonthIndex = (DateTime.now().month - 1);
  bool isMonthChanged = false;
  final List<String> _monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  int get currentMonthIndex {
    return _currentMonthIndex;
  }

  void goNext() {
    if (_currentMonthIndex == 11) {
      _currentMonthIndex = 0;
    } else {
      _currentMonthIndex += 1;
    }
    isMonthChanged = true;
    notifyListeners();
  }

  void goPrevious() {
    if (_currentMonthIndex == 0) {
      _currentMonthIndex = 11;
    } else {
      _currentMonthIndex -= 1;
    }
    isMonthChanged = true;
    notifyListeners();
  }

  get getCurrentMonth => _monthList[_currentMonthIndex];

  get getNextMonth => _currentMonthIndex == 11
      ? _monthList[0]
      : _monthList[_currentMonthIndex + 1];

  get getPreviousMonth => _currentMonthIndex == 0
      ? _monthList[11]
      : _monthList[_currentMonthIndex - 1];

  get getNumberOfDays {
    List<int> daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysPerMonth[_currentMonthIndex];
  }

  int get getStartingDay {
    var firstDayOfYear =
        DateTime(DateTime.now().year, _currentMonthIndex + 1, 1);
    int weekDay = (firstDayOfYear.weekday) - 1;
    return weekDay;
  }

  String firstLetters(String input) {
    return input.length > 3 ? input.substring(0, 3) : input;
  }
}
