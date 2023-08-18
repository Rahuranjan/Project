
import 'package:flutter/material.dart';
import 'package:project/data/dataModel.dart';

class PrimaryMuscleProvider extends ChangeNotifier {
  String temp = "sales";
  List<Menu> data = [];

  void settemp(){
    temp = data.toString() ;
  }
}