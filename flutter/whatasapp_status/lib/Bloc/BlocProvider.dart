import 'package:flutter/material.dart';
import 'package:whatasapp_status/Bloc/Bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  BlocProvider({required this.bloc, required this.child});

  final Bloc bloc;
  final Widget child;
  @override
  _BlocProviderState createState() => _BlocProviderState();

  static T of<T extends Bloc>(BuildContext context) {
    BlocProvider<T>? provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();

    if (provider == null) {
      throw Exception("Bloc Not Found");
    } else {
      return provider.bloc as T;
    }
  }
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    widget.bloc.dispose();
  }
}
