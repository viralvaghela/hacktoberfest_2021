import 'package:notes_flutter/model/Notes.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static late Database database;

  static Future<void> initilizeDatabase() async {
    database = await openDatabase('notes_database.db', onCreate: (db, version) {
      db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, data TEXT,color INTEGER DEFAULT 0)");
    }, version: 1);
  }

  static Future<void> deleteNote(int id) async {
    if (database.isOpen) {
      await database.delete("notes", where: "id=?", whereArgs: [id]);
    }
  }

  static Future<void> addNoteToDatabase(Note note) async {
    if (database.isOpen) {
      if (note.id != null) {
        await database.insert(
            "notes",
            {
              "title": note.title,
              "data": note.data,
              "id": note.id,
              "color": note.color
            },
            conflictAlgorithm: ConflictAlgorithm.replace);
      } else {
        await database.insert(
            "notes",
            {
              "title": note.title,
              "data": note.data,
              "color": note.color,
            },
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
  }

  static Future<List<Note>> getNotesFromDatabase() async {
    final List<Map<String, dynamic>> maps = await database.query('notes');

    print(maps);
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Note(
        maps[i]['title'],
        maps[i]['data'],
        id:maps[i]['id'],
        color:maps[i]['color']??0,
      );
    });
  }

  static void dispose() async{
    await database.close();
  }
}
