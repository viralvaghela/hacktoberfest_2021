import 'package:flutter/material.dart';

class CustomStyle {
  TextStyle withMaskResult =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green);
  TextStyle withoutMaskResult =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red);
  Decoration withMaskContainer = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: Colors.green.withAlpha(30),
         boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withAlpha(50),
                    blurRadius: 25.0,
                    spreadRadius: 5.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  ),
                ]);
  Decoration withoutMaskContainer = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: Colors.red.withAlpha(30),
      boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withAlpha(50),
                    blurRadius: 50.0,
                    spreadRadius: 5.0,
                    
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  ),
                ]);
}
