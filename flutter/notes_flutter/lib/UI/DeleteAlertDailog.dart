import 'package:flutter/material.dart';
import 'package:notes_flutter/bloc/BlocProvider.dart';
import 'package:notes_flutter/bloc/NoteActionsBloc/NoteActionBloc.dart';
import 'package:notes_flutter/bloc/NoteActionsBloc/NoteActionEvent.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListBloc.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListEvent.dart';
import 'package:notes_flutter/model/Notes.dart';

class DeleteAlertDailog extends StatelessWidget {
  const DeleteAlertDailog({
    required this.note,
    required this.bloc,
  }) : super();

  final Note? note;
  final NoteActionBloc bloc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Are you sure you want to delete"),
      content: Row(
        children: [
          TextButton(
              onPressed: () {
                if (note!.id != null) {
                  bloc.eventSink
                      .add(DeleteNote(note!));
                }
                BlocProvider.of<NoteListBloc>(context)
                    .eventSink
                    .add(RefreshNotes());
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("YES")),
          TextButton(
              onPressed: () {
                bloc.eventSink.add(DeleteNote(note!));
                Navigator.pop(context);
              },
              child: Text("NO"))
        ],
      ),
    );
  }
}