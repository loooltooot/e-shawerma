import 'dart:async';
import 'package:e_shaurma/res/classes/order.dart';
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
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE orders(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, list TEXT)'
        );
        await db.execute(
          'CREATE TABLE clients(id INTEGER PRIMARY KEY, name TEXT, amount TEXT)'
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
        'name': name,
        'amount': 0
      },
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<String> getClientNameById(id) async {
    final db = await dbProvider.db;

    var res = await db.query("clients", where: "id = ?", whereArgs: [id]);

    return res.isEmpty ? '' : res.first['name'] as String;
  }

  Future<String> getClientAmountById(id) async {
    final db = await dbProvider.db;

    var res = await db.query("clients", where: "id = ?", whereArgs: [id]);

    return res.isEmpty ? '0' : res.first['amount'] as String;
  }

  Future<Order> insertOrder(Order order) async {
    final db = await dbProvider.db;

    final id = await db.insert(
        'orders',
        order.toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );

    return order.copy(id: id);
  }

  Future<List<Order>> getOrders() async{
    final db = await dbProvider.db;

    final List<Map<String, dynamic>> maps = await db.query('orders');

    maps.forEach((element) {
      print(element);
    });
    
    return List.generate(maps.length, (index) => Order.fromJSON(maps[index]));
  }
}