import 'package:notes_flutter/LocalDatabase/LocalDatabase.dart';
import 'package:notes_flutter/bloc/Bloc.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListEvent.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListState.dart';
import 'package:notes_flutter/model/Notes.dart';

class NoteListBloc extends Bloc<NoteListEvent, NoteListState> {
  NoteListBloc():super();

  //  NoteListBloc.withInitialState(NoteListState initialState) : super.withInitialState(initialState);

  Future<List<Note>> getAllNotes() async {
    List<Note> val = [];
    await LocalDatabase.getNotesFromDatabase().then((value) {
      val = value;
    });
    return val;
  }

  void dispose() {
    super.dispose();
  }

  @override
  Future<void> mapEventToState(event) async {
    if (event is InitilizeNotes) {
      emitState(NotesLoadingState());
      var data = await getAllNotes();
      emitState(NotesLoadingCompletedState(data));
    } else if (event is EditingNotesCompleted) {
      emitState(NotesLoadingState());
      var data = await getAllNotes();
      emitState(NotesLoadingCompletedState(data));
    } else if (event is RefreshNotes) {
      emitState(NotesLoadingState());
      var data = await getAllNotes();
      emitState(NotesLoadingCompletedState(data));
    }
  }
}
