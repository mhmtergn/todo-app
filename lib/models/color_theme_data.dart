import 'package:flutter/material.dart';

ThemeData _tealTheme = ThemeData(
  primaryColor: Colors.teal,
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: Colors.teal,
  accentColor: Colors.teal,
  appBarTheme: AppBarTheme(color: Colors.teal),
  textTheme: TextTheme(
    subtitle1: TextStyle(
      color: Colors.black,
    ),
    headline3: TextStyle(color: Colors.black),
  ),
);

ThemeData _redTheme = ThemeData(
  primaryColor: Colors.redAccent,
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: Colors.redAccent,
  accentColor: Colors.teal,
  appBarTheme: AppBarTheme(color: Colors.redAccent),
  textTheme: TextTheme(
    subtitle1: TextStyle(
      color: Colors.black,
    ),
    headline3: TextStyle(color: Colors.black),
  ),
);

class ColorThemeData with ChangeNotifier {
  bool _isRed = false;

  bool get isRed => _isRed;

  ThemeData get themeColor {
    return _isRed == true ? _redTheme : _tealTheme;
  }

  void toggleTheme() {
    _isRed = !_isRed;
    notifyListeners();
  }
}
