import 'package:flutter/material.dart';
import 'package:sports_arm/acedemy_data.dart';
import 'package:sports_arm/item_widget.dart';

class Forms extends StatefulWidget {
  Forms(this._set);
  final Function _set;
  @override
  _FormsState createState() => _FormsState();
}

TextEditingController _clubController = TextEditingController();
TextEditingController _playerController = TextEditingController();
TextEditingController _coachController = TextEditingController();
TextEditingController _gameController = TextEditingController();
TextEditingController _centerController = TextEditingController();
TextEditingController _locController = TextEditingController();

class _FormsState extends State<Forms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormWid("Academy Name", _clubController),
            TextFormWid("Player Number", _playerController),
            TextFormWid("Coach Number", _coachController),
            TextFormWid("Game", _gameController),
            TextFormWid("Center Head", _centerController),
            TextFormWid("Location", _locController),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              key: const ValueKey("Submit"),
              onPressed: ({int index = 0}) {
                acedemy.add(Acedemy(
                    _clubController.text,
                    int.parse(_playerController.text),
                    int.parse(_coachController.text),
                    _gameController.text,
                    _centerController.text,
                    _locController.text));
                setState(() {
                  _clubController.clear();
                  _playerController.clear();
                  _coachController.clear();
                  _gameController.clear();
                  _centerController.clear();
                  _locController.clear();
                });
                myState.setState(() {});
                widget()._set();
                Navigator.pop(context);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
TextFormWid(String Skey, TextEditingController _Controller) {
  return TextFormField(
    key: ValueKey(Skey),
    textAlign: TextAlign.center,
    decoration: InputDecoration(hintText: Skey),
    controller: _Controller,
  );
}
