import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider dbProvider = DatabaseProvider._();

  static Database? _db;

  Future<Database> get db async {
    if(_db != null) return _db!;

    _db = await openDB();
    return _db!;
  }

  Future<Database> openDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    final db = openDatabase(
      join(await getDatabasesPath(), 'e-shawerma.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE clients(id INTEGER PRIMARY KEY, name TEXT)'
        );
      },
      version: 1
    );
    return db;
  }

  Future<void> insertClient(String name) async {
    final db = await dbProvider.db;

    await db.insert(
      'clients',
      {
        'id': 0,
        'name': name
      },
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<String> getClientNameById(id) async {
    final db = await dbProvider.db;

    var res = await db.query("clients", where: "id = ?", whereArgs: [id]);

    return res.isEmpty ? '' : res.first['name'] as String;
  }
}