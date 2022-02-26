import 'dart:async';
import 'package:amigatoy/database/database.dart';
import 'package:amigatoy/Models/models.dart';

class UserDao{

  final dbProvider = DatabaseProvider.dbProvider;
  final String columnuserId = 'user_id';
  final String columnUsername = 'user_name';
  final String columnuserToken = 'user_token';
  final String columnuserExpired = 'user_expired';
  //Adds new Todo records
  Future<int> createUser(User user) async {

//    dbProvider
    final db = await dbProvider.database;
//    print(user.toDatabaseJson());
    var result = db.insert(userTABLE, user.toDatabaseJson());
//    print(result);
    return result;
  }


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
        whereArgs: [token]
    );
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  ///get token from db
  Future<User?> getToken() async {
    final db = await dbProvider.database;
    var maps = await db.query(userTABLE,
        columns: [columnuserId, columnUsername, columnuserToken],
        where: "$columnuserExpired >=datetime('now')",
        orderBy: "$columnuserId DESC",
        limit: 1
    );
    if (maps.length > 0) {
      return User.fromMap(maps.first);

      // return await maps.first['user_token']!;
    }
    // return null;
  }
  //delete token after user login
  Future <void> deleteUserbytoken(String token) async {
    final db = await dbProvider.database;
//    count = db
//        .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
//    assert(count == 1);
    await db.delete(
      userTABLE,
      // Use a `where` clause to delete a specific dog.
      where: '$columnuserToken = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [token],
    );
  }

}

