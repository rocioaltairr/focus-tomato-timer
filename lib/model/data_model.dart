import 'package:flutter/material.dart';

class DataModel extends ChangeNotifier {
  int _time = 10;
  Color _currentColor = Colors.amber;
  bool _isRunning = true;
  List<Color> _currentColors = [Colors.yellow, Colors.green];
  bool _reset = false;

  get currentColor => _currentColor;
  get currentColors => _currentColors;
  get isRunning => _isRunning;
  get time => _time;
  get reset => _reset;

  void setColor(Color setColor) {
    _currentColor = setColor;
    notifyListeners();
  }

  void setColors(List<Color> setColors) {
    _currentColors = setColors;
    notifyListeners();
  }

  void setTime(int setTime) {
    _time = setTime;
    notifyListeners();
  }

  void setIsRunning(bool setIsRunning) {
    _isRunning = setIsRunning;
    notifyListeners();
  }

  void setReset(bool setReset) {
    _reset = setReset;
    notifyListeners();
  }
}