import 'package:flutter/material.dart';

class PrimaryMuscleProvider extends ChangeNotifier {
  String? subMenuItemName;
  String? exerciseName;

  void updateSubMenuItem(String stringdata) {
    subMenuItemName = stringdata;
    notifyListeners();
  }
  void updateExerciseName(String data){
    exerciseName = data;
    notifyListeners(); 
  } 
}