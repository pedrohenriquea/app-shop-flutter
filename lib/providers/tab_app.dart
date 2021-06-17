import 'package:flutter/material.dart';

class TabApp with ChangeNotifier {
  bool onlyFavorites = false;

  bool get isOnlyFavorites {
    print(onlyFavorites);
    return onlyFavorites;
  }

  void setOnlyFavorites(bool value) {
      print('setei');
    onlyFavorites = value;
    notifyListeners();
  }
}
