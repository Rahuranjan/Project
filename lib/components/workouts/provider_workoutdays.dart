import "package:flutter/material.dart";

class WorkoutDaysProvider extends ChangeNotifier{
  final List<String> _selectedDays = [];

  List<String> get selectedDays => _selectedDays;

  void addDays(String day){
    _selectedDays.add(day.toString());
    notifyListeners();
  }

  void removeDays(String day){
    _selectedDays.remove(day.toString());
    notifyListeners();
  }
}