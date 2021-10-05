import 'package:flutter/material.dart';

class Constants {
  static final List<Color?> colorsListLight = [
    Colors.white,
    Colors.red[200],
    Colors.blue[200],
    Colors.purple[200],
    Colors.green[200],
    Colors.yellow[200],
  ];

  static final List<Color?> colorsListDark = [
    Colors.white70,
    Colors.red[300],
    Colors.blue[300],
    Colors.purple[300],
    Colors.green[300],
    Colors.yellow[400],
  ];

  static List<Color?> getColors(bool isDark) {
    if (!isDark) {
      return colorsListLight;
    } else {
      return colorsListDark;
    }
  }

  static String appName = "Your Notes";
}
