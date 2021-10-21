import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_simple/constans.dart';

class Dashboard extends StatelessWidget {
  static const routeName = "/registerPage";
  final String username;
  const Dashboard({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(60.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconRegister(),
                  _titleDescription(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconRegister() {
    return Image.network(
      "https://raw.githubusercontent.com/didik-maulana/login_register_layout/master/assets/images/icon_login.png",
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Hai, Selamat Datang $username",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Text(
          "Kamu berhasil login, selamat!.",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
