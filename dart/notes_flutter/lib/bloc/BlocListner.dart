import 'package:flutter/material.dart';

//Not completed
import 'package:notes_flutter/bloc/Bloc.dart';

class BlocListner<T extends Bloc> extends StatefulWidget {
  BlocListner(this.widget, this.bloc);

  final T bloc;
  final Widget widget;
  @override
  _BlocListnerState createState() => _BlocListnerState();
}

class _BlocListnerState extends State<BlocListner> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
