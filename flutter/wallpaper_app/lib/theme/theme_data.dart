import 'package:flutter/material.dart';

class MyThemeData {
  static const Color accentColor = Color(0xFF8A84DF);

  static ThemeData lightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: accentColor,
        colorScheme: const ColorScheme.light(primary: accentColor));
  }
}
