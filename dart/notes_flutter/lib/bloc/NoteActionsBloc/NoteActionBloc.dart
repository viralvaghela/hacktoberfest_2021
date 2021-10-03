import 'dart:async';

import 'package:notes_flutter/LocalDatabase/LocalDatabase.dart';
import 'package:notes_flutter/bloc/NoteActionsBloc/NoteActionState.dart';
import 'package:notes_flutter/model/Notes.dart';

import '../Bloc.dart';
import 'NoteActionEvent.dart';

class NoteActionBloc extends Bloc<NoteActionEvent, NoteActionState> {
  NoteActionBloc() : super();

  // NoteActionBloc.withInitialState(NoteActionState initialState) : super.withInitialState(initialState);

  Future<void> updateNote(Note note) async {
    await LocalDatabase.addNoteToDatabase(note);
  }

  Future<void> addNote(Note note) async {
    await LocalDatabase.addNoteToDatabase(note);
  }

  void deleteNote(Note note) async {
    await LocalDatabase.deleteNote(note.id!);
  }

  void dispose() {
    super.dispose();
  }

  @override
  void mapEventToState(event) {
    if (event is AddNote) {
      addNote(event.note);
    } else if (event is DeleteNote) {
      deleteNote(event.note);
    } else if (event is UpdateNote) {
      updateNote(event.note);
    } else if (event is NewNote) {
      addNote(event.note);
    }
  }
}
