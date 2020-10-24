import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelpr {
  static final _databasename = "user.db";
  static final _databaseversions = 1;

  static final table = "my_table";

  static final columnId = 'id';
  static final columnUser = 'user';
  static final columnPass = 'pass';

  static Database _database;

  DatabaseHelpr._privateConstructor();
  static final DatabaseHelpr instance =
      DatabaseHelpr._privateConstructor(); //crate only single instance

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsdirectory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversions, onCreate: _oncreate);
  }

  Future _oncreate(Database db, int version) async {
    await db.execute(''' CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY,
        $columnUser TEXT NOT NULL,
        $columnPass TEXT NOT NULL
      )''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> querySpecific(String name) async {
    Database db = await instance.database;
    var res = await db.query(table, where: "user = ?", whereArgs: [name]);
    return res;
  }
}
