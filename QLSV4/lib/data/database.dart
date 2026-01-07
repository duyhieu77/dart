import 'package:sqlite3/sqlite3.dart';

class AppDatabase {
  late Database db;

  AppDatabase() {
    db = sqlite3.open('qlsv.db');

    db.execute('''
      CREATE TABLE IF NOT EXISTS students (
        id TEXT PRIMARY KEY,
        name TEXT,
        email TEXT UNIQUE,
        age INTEGER,
        expelled INTEGER
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS subjects (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_id TEXT,
        name TEXT
      )
    ''');
  }
}
