import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_flutter/LocalDatabase/LocalDatabase.dart';
import 'package:notes_flutter/Screens/SplashScreen.dart';
import 'package:notes_flutter/bloc/BlocProvider.dart';
import 'package:notes_flutter/bloc/NoteActionsBloc/NoteActionBloc.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListBloc.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListEvent.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeBloc.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeEvent.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeState.dart';

import 'model/Notes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.initilizeDatabase();
  final bool isDark =
      (await SharedPreferences.getInstance()).getBool("isDark") ?? false;

  LocalDatabase.addNoteToDatabase(Note(
      "This is note1", "This is note 1 content.............",
      color: 0, id: 1));
  LocalDatabase.addNoteToDatabase(Note(
      "This is note2", "This is note 2 content.........",
      color: 1, id: 2));
  LocalDatabase.addNoteToDatabase(Note(
      "This is note3", "This is note 3 content............",
      color: 2, id: 3));
  LocalDatabase.addNoteToDatabase(
      Note("This is note4", "This is note 4 content", color: 3, id: 4));
  LocalDatabase.addNoteToDatabase(
      Note("This is note5", "This is note 5 content", color: 4, id: 5));

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  MyApp(this.isDark);
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    ThemeBloc bloc = ThemeBloc()..eventSink.add(ChangeTheme(isDark));
    return BlocProvider<ThemeBloc>(
      bloc: bloc,
      child: BlocProvider<NoteActionBloc>(
        bloc: NoteActionBloc(),
        child: BlocProvider<NoteListBloc>(
          bloc: NoteListBloc()..eventSink.add(InitilizeNotes()),
          child: WillPopScope(
            onWillPop: onPop,
            child: StreamBuilder<ThemeState>(
                stream: bloc.stateStream,
                builder: (context, snapshot) {
                  return MaterialApp(
                    title: 'Your Notes',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      // scaffoldBackgroundColor: snapshot.data is DarkTheme?Colors.black:Colors.grey[200],
                      brightness: snapshot.data is DarkTheme
                          ? Brightness.dark
                          : Brightness.light,
                      primarySwatch: Colors.orange,
                      appBarTheme: AppBarTheme(
                          elevation: 0, backgroundColor: Colors.transparent),
                      textButtonTheme: TextButtonThemeData(
                          style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.2)),
                      )),
                    ),
                    home: SplashScreen(),
                  );
                }),
          ),
        ),
      ),
    );
  }

  Future<bool> onPop() async {
    LocalDatabase.dispose();
    return true;
  }
}
