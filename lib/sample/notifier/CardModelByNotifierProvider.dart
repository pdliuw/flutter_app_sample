import 'package:flutter/material.dart';

class CardModelBYNotifierProvider extends ChangeNotifier {
  String _name = "Air";
  int _age = 0;

  int get age => _age;
  set age(int age) {
    this._age = age;
  }

  String get name => _name;

  set name(String name) {
    this._name = name;
  }

  notify(){
    notifyListeners();
  }
}
