import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'Note.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE "Notes"(
      id INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY ,
      notes TEXT NOT NULL
    )
    ''');
    print("create datebase and table");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deletData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  //Delet Database
  mydeleteDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'Note.db');
    await deleteDatabase(path);
  }
}
