import 'package:flutter/material.dart';

class TempData extends ChangeNotifier {
  String? data;

  void updateString(String stringdata) {
    data = stringdata;
    notifyListeners();
  }
}
