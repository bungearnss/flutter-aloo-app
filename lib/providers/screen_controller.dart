import 'package:flutter/material.dart';

class ScreenController with ChangeNotifier {
  int _screenIndex = 0;
  String _activityType = "Walking";
  int get screenIndex => _screenIndex;
  String get activityType => _activityType;

  Future<void> chageScreenIndex(int index) async {
    _screenIndex = index;
    notifyListeners();
    // print("#####ControllerIndex: $index");
  }

  Future<void> chageActivityType(String type) async {
    _activityType = type;
    notifyListeners();
    // print("#####ControllerType: $type");
  }
}
