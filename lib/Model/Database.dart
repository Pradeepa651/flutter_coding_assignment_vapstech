import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'User.dart';

class DatabaseHelper {
  static Database? _database;

  DatabaseHelper() {}
  //
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB('users.DB');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
  CREATE TABLE IF NOT EXISTS users_db (
    name  TEXT PRIMARY KEY ,
    password TEXT,
    email TEXT,
    phone TEXT,
    profession TEXT
  )
''');
  }

  Future<int?> saveData(User user) async {
    var dbClient = await database;
    var res = await dbClient?.insert('users_db', user.toMap());
    return res;
  }

  Future<User?> getLoginUser(String name, String password) async {
    var dbClient = await database;
    var res = await dbClient?.rawQuery("SELECT * FROM users_db ");

    if (res != null && res.isNotEmpty) {
      for (final r in res) {
        if (r.containsValue(name) && r.containsValue(password)) {
          print(User.fromMap(r));
          return User.fromMap(r);
        }
      }
    }
    return null;
  }
}
