import 'package:flutter/material.dart';
import 'package:notes_flutter/bloc/Bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  BlocProvider({required this.child, required this.bloc});

  final Widget child;
  final T bloc;

  static T of<T extends Bloc>(BuildContext context) {
    BlocProviderInherited<T> provider =
        context.findAncestorWidgetOfExactType<BlocProviderInherited<T>>()
            as BlocProviderInherited<T>;
    return provider.bloc;
  }

  @override
  BlocProviderState<T> createState() {
    return BlocProviderState();
  }

  static typeOf<T>() {
    return T;
  }
}

class BlocProviderState<T extends Bloc> extends State<BlocProvider<T>> {
  @override
  Widget build(BuildContext context) => BlocProviderInherited(
        child: widget.child,
        bloc: widget.bloc,
      );

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

class BlocProviderInherited<T> extends InheritedWidget {
  BlocProviderInherited({
    required Widget child,
    required this.bloc,
  }) : super(child: child);

  final T bloc;

  @override
  bool updateShouldNotify(BlocProviderInherited oldWidget) => false;
}
