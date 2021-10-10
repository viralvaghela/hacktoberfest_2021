import 'package:flutter/material.dart';

class ItemCountWidget extends StatelessWidget {
  final int count;

  ItemCountWidget({this.count});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          alignment: Alignment.center,
          child: Text("$count",
              style: TextStyle(color: Colors.white, fontSize: 18)),
          color: Colors.orange,
          width: 35,
          height: 35),
    );
  }
}
