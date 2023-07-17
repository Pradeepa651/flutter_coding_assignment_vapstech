import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'User.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  Database? _db;

  DatabaseHelper.internal() {}

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'myapp.db');

    // Open/create the database at a given path
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE User(username TEXT PRIMARY KEY , email TEXT, password TEXT , profession TEXT , phone TEXT)',
    );
  }

  Future<int?> saveUser(User user) async {
    var dbClient = await db;

    List<Map<String, Object?>>? existingUsers = await dbClient?.query(
      'User',
      where: 'username = ?',
      whereArgs: [user.username],
    );

    if (existingUsers != null && existingUsers.isNotEmpty) {
      return -1;
    }
    return await dbClient?.insert('User', user.toMap());
  }

  Future<User?> getUser(String username, String password) async {
    var dbClient = await db;
    var result = await dbClient?.query(
      'User',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (result != null && result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return null;
    }
  }
}
