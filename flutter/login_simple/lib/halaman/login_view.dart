import 'package:flutter/material.dart';
import 'package:login_simple/constans.dart';
import 'package:login_simple/halaman/dashboard.dart';
import 'package:login_simple/halaman/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_simple/api/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool success = false, error = false;
  String message = "";

  TextEditingController usernya = TextEditingController();
  TextEditingController passnya = TextEditingController();

  void _cekLogin() async {
    Api.cekLogin(usernya.text, passnya.text).then((value) {
      setState(() {
        error = value.error;
        message = value.message;
        success = value.success;
        if (success && !error) {
          //Navigator.pushNamed(context, Dashboard.routeName);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(username: usernya.text),
            ),
          );
        } else if (!success && error) {
          Fluttertoast.showToast(
              msg: message,
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.red,
              webShowClose: false);
        }
        print(success);
        print(message);
        print(error);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: ColorPalette.primaryColor,
            padding: EdgeInsets.all(60.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  _iconLogin(),
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconLogin() {
    return Image.network(
      "https://raw.githubusercontent.com/didik-maulana/login_register_layout/master/assets/images/icon_register.png",
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
          "Sign In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Text(
          "Silahkan login terlebih dahulu dengan mengisikan kredensial username dan password anda, terima kasih.",
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

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: usernya,
          decoration: const InputDecoration(
            hintText: "Username",
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          controller: passnya,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Password",
            icon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              'Login',
              style: TextStyle(
                  color: ColorPalette.primaryColor,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onTap: () {
            _cekLogin();
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        TextButton(
          child: Text(
            "Lupa password?",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          onPressed: () {},
        ),
        TextButton(
          child: Text(
            "Belum punya akun? Daftar disini!",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RegisterPage.routeName);
          },
        ),
      ],
    );
  }
}
