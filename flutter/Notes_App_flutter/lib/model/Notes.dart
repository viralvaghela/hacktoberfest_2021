class Note {
  late int? id;
  String title;
  String data;
  int color;

  Note(this.title, this.data, {this.id, this.color = 0});

  static clone(Note note) {
    return Note(note.title, note.data, id: note.id, color: note.color);
  }
}
