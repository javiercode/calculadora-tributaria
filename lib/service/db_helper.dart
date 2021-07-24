import 'package:calculadora_tributaria/model/recibo.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();

  DBHelper._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('recibo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE $tableRecibos (
      ${ReciboFields.id} $idType,
      ${ReciboFields.isImportant} $boolType,
      ${ReciboFields.number} $integerType,
      ${ReciboFields.title} $textType,
      ${ReciboFields.description} $textType,
      ${ReciboFields.time} $textType
      )
    ''');
  }

  Future<Recibo> create(Recibo note) async {
    final db = await instance.database;
    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableRecibos, note.toJson());
    return note.copy(id: id);
  }

  Future<Recibo> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableRecibos,
      columns: ReciboFields.values,
      where: '${ReciboFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Recibo.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Recibo>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${ReciboFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableRecibos, orderBy: orderBy);
    return result.map((json) => Recibo.fromJson(json)).toList();
  }

  Future<int> update(Recibo note) async {
    final db = await instance.database;
    return db.update(
      tableRecibos,
      note.toJson(),
      where: '${ReciboFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableRecibos,
      where: '${ReciboFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
