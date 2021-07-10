import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String userTABLE = 'User';
final initScript = [
   "CREATE TABLE "+userTABLE+"("
    "id INTEGER PRIMARY KEY, "
    "user_id INTEGER, "
    "user_name TEXT, "
    "user_token TEXT, "
    "user_expired TEXT"
    ")"];
const migrationScripts = [];

class DatabaseProvider{

  static final DatabaseProvider dbProvider = DatabaseProvider();
//late Database _database=this.startDB();
//  late Database _database=this.createDatabase();
//  DatabaseProvider(){
//   this._database=this.createDatabase();
//  }
//  void set database(Database database) => _database = this.createDatabase();

//  Future<Database> startDB() async{
//    return await createDatabase();
//  }

//  DatabaseProvider({required this._database});
//  Database _database;
  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }
  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, "amigatoy.db");

    var database = await openDatabase(
        path,
        version: migrationScripts.length + 1,
        onCreate: initDB,
        onUpgrade: onUpgrade);
    return database;
  }
  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) async {
    if (newVersion > oldVersion) {
      for (var i = oldVersion - 1; i <= newVersion - 1; i++) {
        await database.execute(migrationScripts[i]);
      }
    }
  }

  void initDB(Database database, int version) async {
//    await database.execute();
    initScript.forEach((script) async => await database.execute(script));
  }

  void closeDB(Database database)async {
    await database.close();
  }

}