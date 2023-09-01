import 'package:flutter/material.dart';

class PrimaryMuscleProvider extends ChangeNotifier {
  String? title;

  void updateString(String stringdata) {
    title = stringdata;
    notifyListeners();
  } 
}