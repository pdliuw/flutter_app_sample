import 'package:flutter/material.dart';

class CardModel extends ChangeNotifier {
  late String _name;
  late int _age;

  static CardModel? singletonInstance;

  CardModel._instance();

  static CardModel getInstance() {
    if (singletonInstance == null) {
      singletonInstance = CardModel._instance();
    }
    return singletonInstance!;
  }

  int get age => _age;

  set age(int age) {
    this._age = age;
  }

  String get name => _name;

  set name(String name) {
    this._name = name;
  }

  notify() {
    notifyListeners();
  }
}
