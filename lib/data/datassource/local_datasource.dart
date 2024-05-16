import 'package:mynotes/constants/constants.dart' as constants;
import 'package:mynotes/model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatasource {
  final String dbName = constants.dbName;
  final String tableName = constants.tableName;

  //open DB, Initialize

  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    return await openDatabase(path,
        version: 1,
        onCreate: (db, version) => db.execute('''CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        contain TEXT,
        mark BOOLEAN,
        tag LIST,
        createdAt INTEGER,
        editedAt INTEGER,
      )'''));
  }

  //insert data
  Future<int> insertNote(Note note) async {
    final db = await _openDatabase();
    return await db.insert(tableName, note.toMap());
  }

  //get all notes
  Future<List<Note>> getNotes() async {
    final db = await _openDatabase();
    final maps = await db.query(tableName, orderBy: 'createdAt DESC');

    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  //get note by id
  Future<Note> getNote(int id) async {
    final db = await _openDatabase();
    final maps = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    return Note.fromMap(maps.first);
  }

//update note
  Future<int> updateNoteById(Note note) async {
    final db = await _openDatabase();

    return await db
        .update(tableName, note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  //delete note by id
  Future<int> deleteNoteById(int id) async {
    final db = await _openDatabase();

    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}