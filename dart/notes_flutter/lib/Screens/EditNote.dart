import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_flutter/UI/DeleteAlertDailog.dart';
import 'package:notes_flutter/UI/NoteForm.dart';
import 'package:notes_flutter/bloc/BlocProvider.dart';
import 'package:notes_flutter/bloc/NoteActionsBloc/NoteActionBloc.dart';
import 'package:notes_flutter/bloc/NoteActionsBloc/NoteActionEvent.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListBloc.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListEvent.dart';

import 'package:notes_flutter/constants/Constants.dart';
import 'package:notes_flutter/model/Notes.dart';

class EditNote extends StatefulWidget {
  EditNote([this.note]);
  final Note? note;
  @override
  _EditNoteState createState() => _EditNoteState(note);
}

class _EditNoteState extends State<EditNote> {
  late NoteActionBloc bloc;

  Note? note;
  late Note changedNote;
  late final StreamController<int> colorStreamController;
  late final StreamSink<int> colorSink;
  late final Stream<int> colorStream;

  _EditNoteState([this.note]) {
    
    changedNote = note==null?Note("", ""):Note.clone(note!);
    colorStreamController = StreamController.broadcast();
    colorSink = colorStreamController.sink;
    colorStream = colorStreamController.stream;
  }

  @override
  void dispose() {
    super.dispose();
    colorStreamController.close();
    colorSink.close();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<NoteActionBloc>(context);
    final TextEditingController titleController =
        TextEditingController(text: note == null ? "" : note!.title);
    final TextEditingController dataController =
        TextEditingController(text: note == null ? "" : note!.data);
    return Hero(
      tag: note ?? "newNote",
      child: StreamBuilder<int>(
          stream: colorStream,
          initialData: note == null ? 0 : note!.color,
          builder: (context, snapshot) {
            return Scaffold(
                backgroundColor: Constants.getColors(
                    Theme.of(context).brightness.index ==
                        0)[snapshot.data ?? 0],
                appBar: AppBar(
                  actions: [
                    TextButton(
                        onPressed: () {
                          changedNote.data = dataController.text.toString();
                          changedNote.title = titleController.text.toString();
                          bloc.eventSink.add(AddNote(changedNote));
                          BlocProvider.of<NoteListBloc>(context)
                              .eventSink
                              .add(RefreshNotes());
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Save",
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return DeleteAlertDailog(note: note, bloc: bloc);
                            });
                      },
                      icon: Icon(Icons.delete),
                    )
                  ],
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NoteForm(
                            note: note,
                            titleController: titleController,
                            dataController: dataController,
                            colorStream: colorStream),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.color_lens),
                          onPressed: () {
                            editScreenBottomSheet(context);
                          },
                        )
                      ],
                    )
                  ],
                ));
          }),
    );
  }

  Future<dynamic> editScreenBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StreamBuilder<int>(
              stream: colorStream,
              initialData: note!.color,
              builder: (context, snapshot) {
                return Container(
                  height: 400,
                  decoration: BoxDecoration(
                      color: HSLColor.fromColor(Color(Constants.getColors(
                                  Theme.of(context).brightness.index ==
                                      0)[snapshot.data!]
                              .hashCode))
                          .withSaturation(0.5)
                          .toColor(),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0))),
                  child: ListView(
                    children: [
                      Icon(Icons.drag_handle),
                      Container(
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Constants.getColors(
                                    Theme.of(context).brightness.index == 0)
                                .length,
                            itemBuilder: (context, position) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    changedNote.color = position;

                                    colorSink.add(position);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                        )),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Constants.getColors(
                                          Theme.of(context).brightness.index ==
                                              0)[position],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              });
        });
  }
}
