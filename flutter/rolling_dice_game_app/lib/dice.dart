// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void diceFaceChanged() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // 1 -6

      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: <Widget>[
            Expanded(
              // flex: 2,
              child: TextButton(
                onPressed: () {
                  diceFaceChanged();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset("images/dice$leftDiceNumber.png"),
                ),
              ),
            ),
            Expanded(
              // flex: 3,
              child: TextButton(
                onPressed: () {
                  diceFaceChanged();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset("images/dice$rightDiceNumber.png"),
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue[800]),
              ),
              onPressed: () {
                diceFaceChanged();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, right: 25.0, left: 25.0),
                child: Text(
                  "Roll the Dice",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
