

import 'package:flutter/material.dart';
import 'package:notes_flutter/model/Notes.dart';

class NoteForm extends StatelessWidget {
  const NoteForm({
    required this.note,
    required this.titleController,
    required this.dataController,
    required this.colorStream,
  });

  final Note? note;
  final TextEditingController titleController;
  final TextEditingController dataController;
  final Stream<int> colorStream;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Title", counterText: ""),
            maxLength: 250,
            controller: titleController,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: dataController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter your Note here",
            ),
            style: TextStyle(
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
