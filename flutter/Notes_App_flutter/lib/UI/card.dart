import 'package:flutter/material.dart';
import 'package:notes_flutter/Screens/EditNote.dart';
import 'package:notes_flutter/constants/Constants.dart';
import 'package:notes_flutter/model/Notes.dart';

class NoteCard extends StatelessWidget {

  final Note note;

  NoteCard(this.note);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: note,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditNote(note);
          }));
        },
        child: Card(
          // color: Constants.colors[note.color],
          color: Constants.getColors(Theme.of(context).brightness.index==0)[note.color],
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 300,
              minHeight: 100,
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    note.data,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
