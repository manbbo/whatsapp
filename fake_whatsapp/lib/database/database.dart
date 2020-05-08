import 'dart:html';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  final String tableName;

  static Database _database;

  DbProvider({ this.tableName });

  Future<Database> get database async {
    if (_database != null)
      return _database;

    _database = await initDB(tableName);
    return _database;
  }

  initDB(String tableName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = (directory.path + "/" + "$tableName.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
    onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $tableName ('
          'id INTEGER AUTO_INCREMENT PRIMARY KEY');
    });
  }

  /// CRUD
  /// Create - POST
  /// Read - GET
  /// Update - PUT
  /// Delete - DELETE
  ///

  create (String tableName, { object }) async {
    final db = await database;
    var res = await db.insert(tableName, object);
    return res;
  }

  createRaw (String tableName, {String params, String items}) async {
    final db = await database;
    var res = await db.rawInsert("INSERT INTO $tableName ($params)"
        "VALUES ($items)");
    return res;
  }

  post<T> (String tableName, T object) async {

  }
  getOne (String tableName, List<String> condition) async {
    final db = await database;
    var res = await db.rawQuery("SELECT ${condition[0]} FROM $tableName WHERE ${condition[1]}");
    return res;
  }
  getAll<T> (T object, [T method]) async {
    final db = await database;
    var res = await db.query(tableName);
    //var getType = object.runtimeType;
    List<T> list;
    list = (res.isNotEmpty)? res.map((c) => method) : []; // the method: (c) => User.fromMap(c)).toList()
    return list;
  }

  void teste<T>([T Method]) {
    return null;
  }
  putOne (String tableName, { item }) async {

  }
  putAll ([String item = "*"]) async {

  }
  delete (String tableName, { item }) async {

  }
}

