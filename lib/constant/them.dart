import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static final lightTheme =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.white);
}

class DarkTheme {
  static final darkTheme = ThemeData(
      cupertinoOverrideTheme: const CupertinoThemeData(
    scaffoldBackgroundColor: CupertinoColors.black,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
    ),
    brightness: Brightness.dark,
    barBackgroundColor: CupertinoColors.black,
  ));
}
