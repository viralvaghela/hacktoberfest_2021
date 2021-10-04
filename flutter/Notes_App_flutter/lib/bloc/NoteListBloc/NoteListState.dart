import 'package:notes_flutter/bloc/Bloc.dart';
import 'package:notes_flutter/model/Notes.dart';

abstract class NoteListState extends CustomState {
  List<Note>? data;
  NoteListState([this.data]);
}

class InitialState extends NoteListState {
  InitialState(List<Note> data):super(data);
}

class NotesLoadingState extends NoteListState {
}

class NotesLoadingCompletedState extends NoteListState {
  NotesLoadingCompletedState(List<Note> data):super(data);
}
