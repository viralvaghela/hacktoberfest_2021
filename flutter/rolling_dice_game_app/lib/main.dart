// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          title: Center(child: Text("Dice Rolling Game")),
          backgroundColor: Colors.blue[800],
        ),
        body: Dice()
        ),
    );
  }
}
