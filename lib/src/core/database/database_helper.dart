import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'db_tables.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        for (var createTable in DBTables.createTables.values) {
          await db.execute(createTable);
        }
      },
    );
  }
}