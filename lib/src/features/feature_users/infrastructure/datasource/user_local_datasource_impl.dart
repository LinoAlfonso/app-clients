import 'package:sqflite/sqflite.dart';

import '../../domain/domain.dart';
import '../mappers/user_db_mapper.dart';
import '../mappers/user_mapper.dart';
import '../../../../core/database/database_helper.dart';
import '../../../../core/database/db_tables.dart';

class UserLocalDatasourceImpl implements UserLocalDatasource {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  Future<List<User>> getUsers() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(DBTables.users);

    return maps
        .map((map) => UserMapper.dbModelToEntity(UserDBMapper.fromMap(map)))
        .toList();
  }

  Future<void> saveUsers(List<User> users) async {
    final db = await _databaseHelper.database;
    await db.transaction((txn) async {
      for (var user in users) {
        final userDb = UserMapper.entityToDBModel(user);
        await txn.insert(
          DBTables.users,
          userDb.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<bool> hasUsers() async {
    final db = await _databaseHelper.database;
    final count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${DBTables.users}')
    );
    return count != null && count > 0;
  }
}