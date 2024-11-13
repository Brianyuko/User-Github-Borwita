import 'package:sqflite/sqflite.dart';
import 'package:user_github_borwita/data/models/user_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblFavorite = 'favorites';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final dbPath = '$path/github_app.db';
    var db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tblFavorite (
        id INTEGER PRIMARY KEY,
        avatarUrl TEXT,
        url TEXT,
        type TEXT,
        username TEXT,
        name TEXT,
        email TEXT,
        company TEXT,
        followers INTEGER,
        following INTEGER
      );
    ''');
  }

  Future<int> insertFavorite({required UserModel user}) async {
    final db = await database;
    return db!.insert(
      _tblFavorite,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> removeFavorite({required UserModel user}) async {
    final db = await database;
    return db!.delete(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<Map<String, dynamic>?> getFavoriteById({required int id}) async {
    final db = await database;
    final result = await db!.query(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblFavorite);
    return results;
  }
}
