import 'package:flutter/material.dart';

class PrimaryMuscleProvider extends ChangeNotifier {
  String? title;
  String? temp;

  void updateString(String stringdata) {
    title = stringdata;
    notifyListeners();
  }
  void updateTemp(String data){
    temp = data;
    notifyListeners(); 
  } 
}