

import 'package:notes_flutter/bloc/Bloc.dart';


abstract class NoteListEvent extends Event{
}

class InitilizeNotes extends NoteListEvent{}

class EditingNotes extends NoteListEvent{}

class EditingNotesCompleted extends NoteListEvent{}

class RefreshNotes extends NoteListEvent{}


