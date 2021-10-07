import 'package:notes_flutter/bloc/Bloc.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeEvent.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeState.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  SharedPreferences? prefs;

  ThemeBloc() : super();

  // ThemeBloc.withInitialState(ThemeState initialstate) : super.withInitialState(initialstate);
  @override
  Future<void> mapEventToState(Event event) async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      // prefs!.setBool("isDark", false);
    }
    if (event is ChangeTheme) {
      if (event.isDark) {
        prefs!.setBool("isDark", true);
        emitState(DarkTheme());
      } else {
        prefs!.setBool("isDark", false);

        emitState(LightTheme());
      }
    }
  }
}
