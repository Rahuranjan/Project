import "package:flutter/material.dart";

class SelectMusclesProvider extends ChangeNotifier{
  final List<String> _selectedMuscles = [];

  List<String> get selectedMuscles => _selectedMuscles;

  void addMuscles (String muscles) {
    _selectedMuscles.add(muscles);
    notifyListeners();
  }
  void removeMuscles (String muscles){
    _selectedMuscles.remove(muscles);
    notifyListeners();
  }
}