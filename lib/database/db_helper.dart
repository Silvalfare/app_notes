import 'package:app_notes/model/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'notes.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, tanggal TEXT, isi TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertNotes(Notes notes) async {
    final db = await DbHelper.db();
    await db.insert(
      'notes',
      notes.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> updateNotes(Notes notes) async {
    final db = await DbHelper.db();
    await db.update(
      'notes',
      notes.toMap(),
      where: 'id = ?',
      whereArgs: [notes.id],
    );
  }

  static Future<void> deleteNotes(int id) async {
    final db = await DbHelper.db();
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Notes>> getAllNotes() async {
    final db = await DbHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('notes');

    return List.generate(maps.length, (i) => Notes.fromMap(maps[i]));
  }
}
