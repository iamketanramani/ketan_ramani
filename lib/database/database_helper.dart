import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Create DatabaseHelper Instance => final dbHelper = DatabaseHelper.instance;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper? instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  static const _databaseName = 'user.db';
  static const _databaseVersion = 1;

  static const tableUser = 'tbl_user';

  static const colId = 'id';
  static const colName = 'name';
  static const colEmail = 'email';
  static const colContactNo = 'contact_no';
  static const colEducation = 'education';
  static const colCurrentCopmany = 'current_company';
  static const colDesignation = 'designation';
  static const colProjectTitle = 'project_title';
  static const colProjectDescription = 'project_description';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /* Future<Database> */ _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreateDB);
  }

  void _onCreateDB(Database db, int version) async {
    String _sqlTableUser = '''
    CREATE TABLE $tableUser(
      $colId INTEGER PRIMARY KEY AUTOINCREMENT, 
      $colName TEXT,
      $colEmail TEXT,
      $colContactNo TEXT, 
      $colEducation TEXT, 
      $colCurrentCopmany TEXT, 
      $colDesignation TEXT, 
      $colProjectTitle TEXT, 
      $colProjectDescription TEXT
    )
    ''';

    await db.execute(_sqlTableUser);
  }

  // Method to Insert Record
  Future<int> insert(String tableName, Map<String, dynamic> data) async {
    Database db = await instance!.database;
    return await db.insert(tableName, data);
  }

  // Method to Update Record
  Future<int> update(
    String tableName, {
    required String whereColumn,
    required int whereColumnValue,
    required Map<String, dynamic> data,
  }) async {
    Database db = await instance!.database;
    var result = await db.update(tableName, data,
        where: '$whereColumn = ?', whereArgs: [whereColumnValue]);
    return result;
  }

  // Method to Delete Specific Records from Table Specified
  Future<int> delete(String tableName,
      {required String whereColumn, required int whereColumnValue}) async {
    Database db = await instance!.database;
    var result = await db.delete(tableName,
        where: '$whereColumn = ?', whereArgs: [whereColumnValue]);
    return result;
  }

  // Method to Get All Records from Table Specified
  Future<List<Map<String, dynamic>>> queryAll(String tableName) async {
    Database db = await instance!.database;
    return await db.query(tableName);
  }

  // Method to Get Specific Records from Table Specified
  Future<List<Map<String, dynamic>>> querySpecific(String tableName,
      {required String whereColumn, required dynamic whereColumnValue}) async {
    Database db = await instance!.database;
    var result = await db.rawQuery(
        'SELECT * FROM $tableName WHERE $whereColumn = ?', [whereColumnValue]);
    return result;
  }

  // Custom Query
  Future<List<Map<String, dynamic>>> customQuery(String query) async {
    Database db = await instance!.database;
    var result = await db.rawQuery(query);
    return result;
  }

  // Method to Get Last Inserted Row ID from Table Specified
  Future<int> lastId(String table) async {
    var lastId = null;
    Database db = await instance!.database;
    var result = await db.rawQuery('SELECT COUNT(*) FROM $table');
    for (var element in result) {
      lastId = element['COUNT(*)'];
    }
    return lastId;
  }

  // Method to Get Last Inserted Row from Table Specified
  Future<Map<String, dynamic>> lastRow(String table, String primaryKey) async {
    Map<String, dynamic> data = {};

    var lId;
    await lastId(table).then((value) {
      lId = value;
    });

    if (lId == 0) {
      data = {};
    } else {
      await querySpecific(table, whereColumn: primaryKey, whereColumnValue: lId)
          .then((value) {
        data = value[0];
      });
    }

    return data;
  }
}
