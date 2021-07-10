import 'dart:async';
import 'package:amigatoy/database/database.dart';
import 'package:amigatoy/Models/models.dart';

class UserDao{

  final dbProvider = DatabaseProvider.dbProvider;
  final String columnuserId = 'userid';
  final String columnUsername = 'username';
  final String columnuserToken = 'token';
  //Adds new Todo records
  Future<int> createUser(User user) async {

//    dbProvider
    final db = await dbProvider.database;
    var result = db.insert(userTABLE, user.toDatabaseJson());
    return result;
  }

  //Get All User items
  //Searches if query string was passed
//  Future<List<User>> getUserlist({required List<String> columns,String? query}) async {
//    final db = await dbProvider.database;
//
//    late List<Map<String, dynamic>> maps;
//    if (query != null&&query.isNotEmpty) {
////      if (query.isNotEmpty)
//        maps = await db.query(userTABLE,
//            columns: columns,
//            where: 'description LIKE ?',
//            whereArgs: ["%$query%"]);
//    } else {
//      maps = await db.query(userTABLE, columns: columns);
//    }
//
////    List<User> users = result.isNotEmpty
////        ? result.map((item) => User.fromDatabaseJson(item)).toList()
////        : [];
//    return List.generate(maps.length, (i) {
//      return User(
//        id: maps[i]['id'],
//        username: maps[i]['name'],
//        token: maps[i]['age'],
//      );
//    });
//  }
  Future<User?> getUserbyid(int id) async {
    final db = await dbProvider.database;
    var maps = await db.query(userTABLE,
        columns: [columnuserId, columnUsername, columnuserToken],
        where: '$columnuserId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<User?> getUserbytoken(String token) async {
    final db = await dbProvider.database;
    var maps = await db.query(userTABLE,
        columns: [columnuserId, columnUsername, columnuserToken],
        where: '$columnuserToken = ?',
        whereArgs: [token]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return null;
  }

}

