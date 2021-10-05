


import 'package:notes_flutter/bloc/Bloc.dart';
import 'package:notes_flutter/model/Notes.dart';

abstract class NoteActionEvent extends Event {
  NoteActionEvent(this.note);
  Note note;
}

class AddNote extends NoteActionEvent {
  AddNote(Note note):super(note);
}

class DeleteNote extends NoteActionEvent {
  DeleteNote(Note note):super(note);

}

class UpdateNote extends NoteActionEvent {
  UpdateNote(Note note):super(note);

}
class NewNote extends NoteActionEvent{
  NewNote(Note note) : super(note);
}
