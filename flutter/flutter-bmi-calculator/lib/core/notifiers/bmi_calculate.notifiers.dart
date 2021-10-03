import 'package:flutter/material.dart';

class BmiNotifier extends ChangeNotifier {
  bmiCalculate(double height, double weight) {
    double bmiValue = weight / (height * height);
    return bmiValue;
  }
}
