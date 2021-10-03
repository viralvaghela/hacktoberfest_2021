import 'package:notes_flutter/bloc/Bloc.dart';

abstract class ThemeEvent extends Event {
  bool isDark;
  ThemeEvent(this.isDark);
}

class ChangeTheme extends ThemeEvent {
  ChangeTheme(bool isDark):super(isDark);
}
