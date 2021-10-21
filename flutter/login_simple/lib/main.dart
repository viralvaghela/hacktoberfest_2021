import 'package:flutter/material.dart';
import 'package:login_simple/halaman/login_view.dart';
import 'package:login_simple/halaman/register_view.dart';
import 'package:login_simple/halaman/dashboard.dart';

void main() {
  //String usr = "";
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login Register Page",
    initialRoute: "/",
    routes: {
      "/": (context) => LoginPage(),
      RegisterPage.routeName: (context) => RegisterPage(),
      //Dashboard.routeName: (context) => Dashboard(username: usr),
    },
  ));
}
