import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'portfolio',
      home: Scaffold(
        appBar: AppBar(),
        body: Text('Hi there'),
      ),
    );
  }
}
