import 'package:notes_flutter/bloc/Bloc.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeEvent.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeState.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super();

  // ThemeBloc.withInitialState(ThemeState initialstate) : super.withInitialState(initialstate);
  @override
  void mapEventToState(Event event) {
    if (event is ChangeTheme) {
      if (event.isDark) {
        emitState(DarkTheme());
      } else {
        emitState(LightTheme());
      }
    }
  }
}
